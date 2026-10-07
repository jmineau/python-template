# python-template maintenance tasks.

tmp := env("TMPDIR", "/tmp")

# Show available recipes
list:
    @just --list

# Generate a project from the working tree (uncommitted changes included)
bake dest=(tmp / "python-template-bake") *data:
    rm -rf {{ dest }}
    uvx copier copy --defaults --vcs-ref=HEAD --data project_name="Test Package" {{ data }} . {{ dest }}
    @echo "Baked into {{ dest }}"

# Bake both PyPI variants and run every check, release step and version check in each
test:
    #!/usr/bin/env bash
    set -euo pipefail
    template="$PWD"
    root="{{ tmp }}/python-template-test"
    rm -rf "$root"
    mkdir -p "$root"
    git_() { git -c user.name="Template Test" -c user.email="test@example.invalid" "$@"; }
    for pypi in true false; do
        dest="$root/pypi-$pypi"
        echo "::group::bake publish_to_pypi=$pypi"
        uvx copier copy --defaults --vcs-ref=HEAD \
            --data project_name="Test Package" --data publish_to_pypi="$pypi" \
            "$template" "$dest"
        cd "$dest"
        git_ init --quiet && git_ checkout --quiet -b main
        uv lock
        git_ add --all
        git_ commit --quiet -m "chore: start from python-template"
        git_ tag v0.1.0
        uv sync --locked
        echo "::endgroup::"

        echo "::group::checks publish_to_pypi=$pypi"
        uv run just quality-check
        uv run just build-docs
        uv run pre-commit run --all-files
        uv run just dist
        echo "::endgroup::"

        echo "::group::versions publish_to_pypi=$pypi"
        test "$(uv run python -m setuptools_scm)" = 0.1.0
        test "$(uv run python -c 'import testpackage; print(testpackage.__version__)')" = 0.1.0
        ls dist/test_package-0.1.0.tar.gz dist/test_package-0.1.0-py3-none-any.whl
        test -z "$(git status --porcelain)" || { git status --short; echo "Checks left the tree dirty." >&2; exit 1; }
        git_ commit --quiet --allow-empty -m "chore: a commit after the release"
        uv sync --locked  # cache-keys: the new commit rebuilds the editable install
        dev="$(uv run python -c 'import testpackage; print(testpackage.__version__)')"
        echo "after one more commit: $dev"
        case "$dev" in 0.1.1.dev1+g*) ;; *) echo "expected 0.1.1.dev1+g..., got $dev" >&2; exit 1;; esac
        echo "::endgroup::"

        echo "::group::changelog draft publish_to_pypi=$pypi"
        git_ commit --quiet --allow-empty -m "feat(io): read the new format"
        git_ commit --quiet --allow-empty -m "fix!: drop the old reader"
        notes="$(uv run just changelog)"
        echo "$notes"
        grep -q '^### Added' <<<"$notes"
        grep -qF -- '- Read the new format (io)' <<<"$notes"
        grep -qF -- '- **Breaking:** Drop the old reader' <<<"$notes"
        ! grep -q 'a commit after the release' <<<"$notes"  # chore commits are left out
        echo "::endgroup::"
        cd "$template"
    done
    echo "All checks passed for both variants."
