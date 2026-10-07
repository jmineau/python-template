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
| `copyright_year` | 2026 | LICENSE |

## What you get

| Area | Tooling |
|---|---|
| Environment | [uv](https://docs.astral.sh/uv/) with a committed `uv.lock`; dev tools and docs in one PEP 735 `dev` group |
| Tasks | [just](https://just.systems/): `just quality-check`, `just test`, `just build-docs`, `just release X.Y.Z`, ... CI runs the same recipes |
| Packaging | setuptools, `src/` layout, PEP 639 license, `py.typed` |
| Versions | [setuptools-scm](https://setuptools-scm.readthedocs.io): the version is the git tag; `.devN` versions between releases |
| Lint and format | [ruff](https://docs.astral.sh/ruff/) (`E F UP B SIM I D213 NPY RUF100`) |
| Types | [pyrefly](https://pyrefly.org) |
| Tests | pytest 9 (strict, warnings are errors, `network`/`slow` markers), parallel with pytest-xdist, pytest-cov, Codecov |
| Docstrings | NumPy style, [docstr-coverage](https://github.com/HunterMcGushion/docstr_coverage) ≥ 95% |
| Docs | Sphinx + PyData theme, autosummary API pages, copy buttons, live preview (`just docs-serve`), built with warnings as errors; versioned on GitHub Pages (`dev/`, one folder per release, `stable/`) with a version dropdown |
| pre-commit | pre-commit-hooks, rST checks, validate-pyproject, [zizmor](https://docs.zizmor.sh); `uv lock`, ruff and pyrefly run from `.venv`, so `uv.lock` pins their versions |
| Changelog | Keep a Changelog, hand-edited; `just changelog` drafts entries from Conventional Commits ([git-cliff](https://git-cliff.org)) |
| CI | Tests (Linux/macOS/Windows × all supported Pythons), Code Quality, Documentation, Publish (tag push → PyPI trusted publishing with attestations → GitHub Release from CHANGELOG → Zenodo) |
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
