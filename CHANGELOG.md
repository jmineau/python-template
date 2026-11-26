# Changelog

All notable changes to the template are documented here. The format follows
[Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/), and versions
follow [Semantic Versioning](https://semver.org/): a major version for changes
that need manual follow-up in projects, a minor one for new tooling, a patch
for fixes. Pull requests leave this file alone: the entries are written at
release. (`template/CHANGELOG.md` is the one generated projects start with.)

## [Unreleased]

## [1.4.1] - 2026-11-26

### Changed

- `publish.yml` pins its actions to commit SHAs, with the version in a comment; other workflows keep tag pins (ci)
- The generated `.gitignore` is cut to what the packages use (226 to 58 lines); `copier update` may conflict on it, keep the project's own extra lines (ci)
- `just cov` runs the `test` recipe (ci)
- The copyright year defaults to the current year (copier)

### Fixed

- Docs deploys queue per ref, so a newer run cannot cancel a waiting release deploy (ci)
- Publish checks that `CHANGELOG.md` has the release's section before uploading to PyPI (ci)
- `copier` rejects `"` and `\` in the project name and description, which broke `pyproject.toml` and `.zenodo.json` (copier)
- `just test` checks `docs_versions.py` on a scratch site (ci)

## [1.4.0] - 2026-11-17

### Added

- A Tests job installs every dependency at its declared minimum (ci)
- The docs use `docs/_static/logo.svg` (`logo_dark.svg`), `favicon.ico` and `social-preview.png` when they exist, and write link-preview tags from the short description (docs)
- A Pyrefly badge in the README (docs)
- README setup step 8: rulesets that protect the default branch and the `v*` release tags, and a `pypi` environment limited to those tags (docs)

### Changed

- Codecov stops commenting on pull requests, and its checks are informational and never fail one (ci)
- The docs navbar shows the package name; the version stays in the site title (docs)

### Fixed

- A dataclass field whose default is a function gets a page for the field, not the function (docs)
- A constant a subclass sets again gets an API page that shows its value (docs)
- The empty code box above a figure made in a suppressed `.. ipython::` block is hidden (docs)

## [1.3.1] - 2026-10-27

### Fixed

- Leave uv.lock to the Upgrade lock workflow, not Dependabot (ci)

## [1.3.0] - 2026-10-26

### Added

- A monthly workflow runs `uv lock --upgrade` and opens a pull request (ci)
- Docstring examples run as tests (test)

### Changed

- A pull request leaves CHANGELOG.md alone; the release step writes it

## [1.2.1] - 2026-10-11

### Fixed

- Raise the pydata-sphinx-theme floor to 0.22 (docs)

## [1.2.0] - 2026-10-09

### Added

- Examples run when the docs build (docs)
- `.. ipython::` blocks run in .rst pages (docs)
- Notebooks and Markdown code cells are a copier question (docs)

### Fixed

- `docs-serve` ignores `docs/_build` and `__pycache__` (docs)

## [1.1.3] - 2026-10-08

### Fixed

- GitHub Pages serves the gh-pages branch; the workflow only pushes it (docs)
- A package's page lists the public names it re-exports (docs)

## [1.1.2] - 2026-10-07

### Changed

- AGENTS.md asks for a docstring on each public attribute and property

### Fixed

- The API-pages extension loads autodoc and autosummary itself (docs)

## [1.1.1] - 2026-10-07

### Fixed

- Inherited-member links resolve however the docs name the base class (docs)

## [1.1.0] - 2026-10-07

### Added

- Pandas-style class pages, with a page per member (docs)
- A subclass page links to what it inherits (docs)
- NumPy pydocstyle by default, a `test_os` question, and an adoption guide
- README and AGENTS examples are kept as written; AGENTS.md says how tests handle warnings

### Fixed

- Follow-ups from moving the packages onto v1.0.0

## [1.0.0] - 2026-10-06

### Changed

- **Breaking:** The template moved from cookiecutter to copier, with modernized tooling
- Versioned docs, changelog drafts (`just changelog`), uv 0.12, wider Dependabot coverage

### Fixed

- Pin setup-uv to an exact release; it publishes no v10 tag (ci)

[Unreleased]: https://github.com/jmineau/python-template/compare/v1.3.1...HEAD
[1.3.1]: https://github.com/jmineau/python-template/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/jmineau/python-template/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/jmineau/python-template/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/jmineau/python-template/compare/v1.1.3...v1.2.0
[1.1.3]: https://github.com/jmineau/python-template/compare/v1.1.2...v1.1.3
[1.1.2]: https://github.com/jmineau/python-template/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/jmineau/python-template/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/jmineau/python-template/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/jmineau/python-template/releases/tag/v1.0.0
