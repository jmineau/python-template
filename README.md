# python-template

A [copier](https://copier.readthedocs.io) template for Python packages, built
from the conventions of [lair](https://github.com/jmineau/lair),
[fips](https://github.com/jmineau/fips), [PYSTILT](https://github.com/jmineau/PYSTILT),
[arl-met](https://github.com/jmineau/arl-met) and friends. Unlike a one-shot
generator, copier records which template version a project came from, so
`copier update` brings later template improvements into existing projects as
an ordinary, reviewable diff.

## Use it

```bash
uv tool install copier          # or run it ad hoc: uvx copier ...
copier copy gh:jmineau/python-template my-package
```

Copier asks a few questions and prints the next steps (`uv lock`, `git init`,
`uv sync`, `uv run pre-commit install`). Later, from inside the project:

```bash
copier update                   # pull in template changes since your last copy/update
```

Copier merges the template's changes with yours; review the diff (conflicts get
git-style markers) and commit it like any other change.

### Questions

| Question | Default | Notes |
|---|---|---|
| `full_name`, `email`, `github_username` | James Mineau | Author and repository owner |
| `orcid`, `affiliation` | James's | For CITATION.cff and Zenodo; may be blank |
| `project_name` | — | Human-readable, e.g. "My Package" |
| `repository_name` | from `project_name` | `my-package` |
| `distribution_name` | from `repository_name` | The `pip install` / PyPI name |
| `package_name` | from `distribution_name` | The import name (`mypackage`) |
| `project_short_description` | — | One line |
| `python_min` | 3.11 | Oldest supported Python; CI tests it through 3.14 |
| `publish_to_pypi` | yes | Adds trusted publishing to PyPI on release |
| `test_os` | Linux, macOS, Windows | Where the tests run; Linux is required (coverage uploads from it) |
| `copyright_year` | 2026 | LICENSE |

## Adopting it in an existing package

Copier can't merge a template into a project that didn't start from it, so the
first time is by hand; `copier update` takes over from then on.

1. Render the template with the package's answers into a scratch folder, and
   compare it with the package:

   ```bash
   copier copy --defaults --data project_name=mypkg --data publish_to_pypi=true ... \
       gh:jmineau/python-template /tmp/mypkg-baked
   diff -ru /tmp/mypkg-baked mypkg
   ```

2. Port what applies, and keep what is the package's own (a compiled extension,
   extra CI jobs, a release schedule). One commit per concern reads best:
   versions from tags (setuptools-scm: drop the static version and its copies,
   and CITATION.cff's `version`), the type checker, the Python floor, the
   template's tooling, docstring style.
3. Copy the rendered `.copier-answers.yml` into the package, then check that
   `copier update --defaults` in a clean clone changes nothing.
4. Expect warnings-as-errors to find things. Fix the package's own warnings;
   a test that triggers one on purpose asserts it with `pytest.warns`; a
   third-party one is ignored by message and module in `[tool.pytest]`.
5. Seed the docs site with the latest release, or the site opens at `dev/`
   until the next tag. Build the release's docs from its tag, add them to the
   `gh-pages` branch with the template's script, and push it:

   ```bash
   git worktree add --detach ../mypkg-docs vX.Y.Z
   (cd ../mypkg-docs && uv sync --frozen && uv run sphinx-build -M html docs docs/_build)
   git clone --single-branch --branch gh-pages https://github.com/OWNER/mypkg site  # or, if none yet:
   #   git init site && git -C site checkout --orphan gh-pages
   uv run --no-project --with packaging python mypkg/.github/scripts/docs_versions.py \
       site ../mypkg-docs/docs/_build/html X.Y.Z --base-url https://OWNER.github.io/mypkg/
   git -C site add --all && git -C site commit -m "docs: publish X.Y.Z" && git -C site push origin gh-pages
   ```

   Without a seed, the Documentation workflow creates the branch on its first
   run on main.
6. On GitHub, once the `gh-pages` branch exists: Settings > Pages > Source:
   Deploy from a branch, branch `gh-pages`, folder `/ (root)`; or

   ```bash
   echo '{"build_type": "legacy", "source": {"branch": "gh-pages", "path": "/"}}' |
       gh api -X PUT repos/OWNER/mypkg/pages --input -
   ```

   GitHub Pages then rebuilds the site after every push to the branch.

## What you get

| Area | Tooling |
|---|---|
| Environment | [uv](https://docs.astral.sh/uv/) with a committed `uv.lock`; dev tools and docs in one PEP 735 `dev` group |
| Tasks | [just](https://just.systems/): `just quality-check`, `just test`, `just build-docs`, `just release X.Y.Z`, ... CI runs the same recipes |
| Packaging | setuptools, `src/` layout, PEP 639 license, `py.typed` |
| Versions | [setuptools-scm](https://setuptools-scm.readthedocs.io): the version is the git tag; `.devN` versions between releases |
| Lint and format | [ruff](https://docs.astral.sh/ruff/) (`E F UP B SIM I D D213 NPY RUF100`; pydocstyle with the NumPy convention) |
| Types | [pyrefly](https://pyrefly.org) |
| Tests | pytest 9 (strict, warnings are errors, `network`/`slow` markers), parallel with pytest-xdist, pytest-cov, Codecov |
| Docstrings | NumPy style, [docstr-coverage](https://github.com/HunterMcGushion/docstr_coverage) ≥ 95% |
| Docs | Sphinx + PyData theme, pandas-style API pages (a page per class, with tables of its attributes and methods, and a page per member), copy buttons, live preview (`just docs-serve`), built with warnings as errors; versioned on GitHub Pages (`dev/`, one folder per release, `stable/`) with a version dropdown |
| pre-commit | pre-commit-hooks, rST checks, validate-pyproject, [zizmor](https://docs.zizmor.sh); `uv lock`, ruff and pyrefly run from `.venv`, so `uv.lock` pins their versions |
| Changelog | Keep a Changelog, hand-edited; `just changelog` drafts entries from Conventional Commits ([git-cliff](https://git-cliff.org)) |
| CI | Tests (the chosen operating systems × all supported Pythons), Code Quality, Documentation, Publish (tag push → PyPI trusted publishing with attestations → GitHub Release from CHANGELOG → Zenodo) |
| Upkeep | Dependabot for actions, pre-commit hooks and `uv.lock` (monthly, grouped, 7-day cooldown; never raises minimum versions) |
| Project files | AGENTS.md, CONTRIBUTING.md, CHANGELOG.md, CITATION.cff, `.zenodo.json`, issue forms, PR template |

Generated projects score clean on the Scientific Python
[repo-review](https://learn.scientific-python.org/development/guides/repo-review/)
(deliberate exceptions are listed in `[tool.repo-review]`), and their workflows
pass [actionlint](https://github.com/rhysd/actionlint) and zizmor.

## Layout

```
copier.yml          questions, computed values (python_max, uv_version) and the after-copy message
template/           the project; files ending in .jinja are rendered, everything else is copied as is
justfile            `just bake`, `just test` for working on the template
.github/workflows/  template.yml bakes the template and runs every check in the result
```

See [CONTRIBUTING.md](CONTRIBUTING.md) to change the template.

## License

MIT; see [LICENSE](LICENSE).
