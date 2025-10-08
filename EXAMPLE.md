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
- `project_slug`: awesome_tool (auto-generated)
- `project_short_description`: A tool for doing awesome things
- `version`: 2024.1.0 (default, calver format)
- `python_version`: 3.10 (default)

## Generated Structure

```
awesome_tool/
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
├── awesome_tool/          # Package source code
│   └── __init__.py        # Package initialization
├── tests/                 # Test files
│   ├── __init__.py
│   └── test_basic.py      # Basic tests
├── .gitignore             # Python .gitignore
├── .pre-commit-config.yaml # Pre-commit hooks
├── CONTRIBUTING.md        # Contribution guidelines
├── LICENSE                # MIT License
├── pyproject.toml         # Modern Python packaging
└── README.md              # Project README
```

## Generated Files

### pyproject.toml

Modern Python packaging with:
- Project metadata
- Dependencies (dev and docs)
- Black configuration (88 char line length)
- pytest configuration with coverage (HTML and XML output)
- mypy configuration for type checking
- Coverage.py configuration with exclusions

### .pre-commit-config.yaml

Automated code quality checks:
- trailing-whitespace
- end-of-file-fixer
- check-yaml, check-json, check-toml
- check-added-large-files
- check-merge-conflict
- debug-statements
- **black** - code formatting
- **isort** - import sorting
- **flake8** - linting
- **mypy** - type checking

### README.md

Template includes:
- **Badges**: Tests, documentation, code quality, coverage, PyPI version, Python versions, license, code style
- Project title and description
- Installation instructions (PyPI, source, development)
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
- Type checking with mypy
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
pip install -e ".[dev]"

# Install pre-commit hooks
pre-commit install

# Run tests
pytest

# Build documentation
cd docs
make html
```

## Customization

After generation, you can customize:
- Add project-specific dependencies to `pyproject.toml`
- Modify pre-commit hooks in `.pre-commit-config.yaml`
- Update documentation theme in `docs/conf.py`
- Add more workflows to `.github/workflows/`
- Update README with project-specific information
- Add your source code to `{{package_name}}/`
- Add tests to `tests/`

## Next Steps

1. Create GitHub repository
2. Push code to GitHub
3. Enable GitHub Pages in repository settings (for documentation)
4. Set up Codecov (optional, for coverage badges)
5. Start coding!
