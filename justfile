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

# Bake with every yes/no question answered yes, then no, and run every check, release step and version check in each
test:
    #!/usr/bin/env bash
    set -euo pipefail
    template="$PWD"
    root="{{ tmp }}/python-template-test"
    rm -rf "$root"
    mkdir -p "$root"
    git_() { git -c user.name="Template Test" -c user.email="test@example.invalid" "$@"; }
    # opt answers both yes/no questions: publish_to_pypi and docs_notebooks.
    for opt in true false; do
        dest="$root/optional-$opt"
        echo "::group::bake optional=$opt"
        uvx copier copy --defaults --vcs-ref=HEAD \
            --data project_name="Test Package" \
            --data publish_to_pypi="$opt" --data docs_notebooks="$opt" \
            "$template" "$dest"
        cd "$dest"
        # Examples that run when the docs build: a figure in a docstring and an .rst
        # page with IPython blocks; with docs_notebooks, a Markdown page with a code
        # cell and a notebook too.
        cp -r "$template/fixtures/always/." .
        pages='session'
        if [ "$opt" = true ]; then
            cp -r "$template/fixtures/notebooks/." .
            pages='session\n   guide\n   notebook'
        fi
        sed -i "s/^   usage$/   usage\n   $pages/" docs/index.rst
        grep -qx '   session' docs/index.rst
        git_ init --quiet && git_ checkout --quiet -b main
        uv lock
        # Without docs_notebooks, Jupyter stays out of the dev tools.
        if [ "$opt" = false ] && grep -q '^name = "ipykernel"$' uv.lock; then
            echo "uv.lock has ipykernel without docs_notebooks." >&2; exit 1
        fi
        git_ add --all
        git_ commit --quiet -m "chore: start from python-template"
        git_ tag v0.1.0
        uv sync --locked
        echo "::endgroup::"

        echo "::group::checks optional=$opt"
        uv run just quality-check
        uv run just build-docs
        # The examples ran: each page's output and figures are in its HTML.
        sed 's/<[^>]*>//g' docs/_build/html/session.html | grep -qF 'square(5) = 25'
        grep -q 'session_squares.png' docs/_build/html/session.html
        grep -q 'class="plot-directive"' docs/_build/html/_autosummary/testpackage.plotting.square.html
        if [ "$opt" = true ]; then
            grep -qF 'square(4) = 16' docs/_build/html/guide.html
            grep -qF 'square(3) = 9' docs/_build/html/notebook.html
            grep -q '<img' docs/_build/html/notebook.html
        fi
        uv run pre-commit run --all-files
        uv run just dist
        echo "::endgroup::"

        echo "::group::versions optional=$opt"
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

        echo "::group::changelog draft optional=$opt"
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
