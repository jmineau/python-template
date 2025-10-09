# Example Generated Project

This document shows an example of what a project generated from this cookiecutter template looks like.

## Generate Example

```bash
cookiecutter https://github.com/jmineau/cookiecutter-python
```

When prompted, you might enter:
- `full_name`: Jane Developer
- `email`: jane@example.com
- `github_username`: janedev
- `project_name`: Awesome Tool
- `repository_name`: awesome-tool (auto-generated from project_name)
- `package_name`: awesometool (auto-generated from project_name)
- `project_short_description`: A tool for doing awesome things
- `year`: 2025 (used to populate the LICENSE and other generated files; also used to form the default `version`)
- `version`: 2025.1.0 (default, calver format)

## Generated Structure

```
awesome-tool/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
│       ├── tests.yml       # Tests on multiple Python versions
│       ├── docs.yml        # Build and deploy docs
│       └── lint.yml        # Code quality checks
├── docs/                   # Sphinx documentation
│   ├── conf.py            # Sphinx configuration
│   ├── index.rst          # Documentation home
│   ├── installation.rst   # Installation guide
│   ├── usage.rst          # Usage examples
│   ├── api.rst            # API reference
│   ├── Makefile           # Build documentation (Unix)
│   └── make.bat           # Build documentation (Windows)
├── src/
│   └── awesometool/       # Package source code
│       ├── __init__.py    # Package initialization
│       └── py.typed       # PEP 561 type checking marker
├── tests/                 # Test files
│   ├── __init__.py
│   └── test_basic.py      # Basic tests
├── .gitignore             # Python .gitignore
├── .pre-commit-config.yaml # Pre-commit hooks
├── CONTRIBUTING.md        # Contribution guidelines
├── LICENSE                # MIT License
├── Makefile               # Development tasks (clean, lint, test, docs, etc.)
├── pyproject.toml         # Modern Python packaging
└── README.md              # Project README
```

## Generated Files

### pyproject.toml

Modern Python packaging with:
- Project metadata
- Dependencies (dev and docs)
- Ruff configuration for linting and formatting
- pytest configuration with coverage (HTML and XML output)
- Pyright configuration for type checking
- Coverage.py configuration with exclusions
- setuptools configuration for src layout
- py.typed support for PEP 561

### .pre-commit-config.yaml

Automated code quality checks:
- trailing-whitespace
- end-of-file-fixer
- check-yaml, check-json, check-toml
- check-added-large-files
- check-merge-conflict
- debug-statements
- **ruff** - linting and formatting (replaces black, isort, flake8)
- **pyright** - type checking

### Makefile

Convenient development commands:
- `make help` - Show available targets
- `make setup` - Set up development environment (install deps, configure pre-commit)
- `make clean` - Remove build artifacts and cache files
- `make coverage` - Run tests with coverage report
- `make lint` - Run ruff to fix code issues
- `make check` - Run ruff check and pytest tests (with verbose output)
- `make docs` - Build HTML documentation
- `make pre-commit` - Run pre-commit hooks on all files

### README.md

Template includes:
- **Badges**: Tests, documentation, code quality, coverage, PyPI version, Python versions, license, ruff
- Project title and description
- Installation instructions (pip and uv, PyPI, source, development)
- Usage example
- Documentation link
- Contributing guidelines link
- License information
- Author information

### CONTRIBUTING.md

Comprehensive guidelines including:
- Getting started
- Development workflow
- Code style requirements
- Testing procedures
- Pull request guidelines
- Bug reporting
- Feature requests

### GitHub Actions Workflows

#### tests.yml
- Runs on: Ubuntu, macOS, Windows
- Python versions: 3.10, 3.11, 3.12
- Uploads coverage to Codecov

#### docs.yml
- Builds Sphinx documentation
- Deploys to GitHub Pages on push to main

#### lint.yml
- Runs all pre-commit hooks
- Linting and formatting with ruff
- Type checking with pyright
- Docstring coverage checking
- Ensures code quality

### Sphinx Documentation

Configured with:
- **Badges**: All status badges displayed at the top
- **PyData Sphinx Theme** - beautiful, responsive theme
- **Napoleon** - NumPy-style docstrings
- **autodoc** - automatic API documentation from docstrings
- **autosummary** - generate summary tables
- **intersphinx** - link to other documentation

## Quick Start After Generation

```bash
# Navigate to project
cd awesome_tool

# Initialize git
git init
git add .
git commit -m "Initial commit from cookiecutter-python"

# Set up development environment
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
make setup

# Run tests
pytest -v

# Build documentation
make docs
```

## Customization

After generation, you can customize:
- Add project-specific dependencies to `pyproject.toml`
- Modify pre-commit hooks in `.pre-commit-config.yaml`
- Update documentation theme in `docs/conf.py`
- Add more workflows to `.github/workflows/`
- Update README with project-specific information
- Add your source code to `src/{{package_name}}/`
- Add tests to `tests/`
- Configure ruff and pyright settings in `pyproject.toml`

## Next Steps

1. Create GitHub repository
2. Push code to GitHub
3. Enable GitHub Pages in repository settings (for documentation)
4. Set up Codecov (optional, for coverage badges)
5. Start coding!
