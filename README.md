# cookiecutter-python

A [Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for creating modern Python packages with best practices built-in.

## Features

This template provides a complete Python package structure with:

- 📦 **Modern Python packaging** with `pyproject.toml`
- 🎨 **Code formatting** with ruff (pre-commit hooks included)
- 📚 **Sphinx documentation** with PyData theme
- 🧪 **Testing setup** with pytest and coverage
- ✅ **Pre-commit hooks** for automated code quality checks
- 🔧 **GitHub Actions workflows** for CI/CD
- 🤝 **Contributing guidelines** for open source collaboration
- 📝 **Python .gitignore** from github/gitignore/Python.gitignore

## Requirements

- Python 3.10 or higher
- [Cookiecutter](https://github.com/cookiecutter/cookiecutter)

## Usage

### Install Cookiecutter

If you haven't already, install cookiecutter:

```bash
pip install cookiecutter
```

### Generate a New Python Package

```bash
cookiecutter https://github.com/jmineau/cookiecutter-python
```

or if you have it cloned locally:

```bash
cookiecutter cookiecutter-python/
```

Cookiecutter reads the configuration from `cookiecutter.json` and will prompt you to customize values for your new project. You can accept the defaults by pressing Enter, or provide your own values:

- `full_name`: Your full name
- `email`: Your email address
- `github_username`: Your GitHub username
- `project_name`: The name of your project (e.g., "My Python Package")
- `repository_name`: The repository name (auto-generated from project_name with spaces replaced by dashes)
- `package_name`: The package name (auto-generated from project_name with spaces removed)
- `project_short_description`: A brief description of your project
- `year`: Year used for default values (e.g., 2025).
- `version`: Initial version (default: 2025.1.0, calver format)

### After Generation

Once your project is generated, follow these steps:

1. Navigate to your new project directory:
   ```bash
   cd your-repository-name
   ```

2. Initialize a git repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit from cookiecutter-python"
   ```

3. Create an environment and install dependencies:
   ```bash
   # Using venv:
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate

   # OR with conda:
   conda create -n myenv python=3.10 -y
   conda activate myenv

   # Install development dependencies:
   python -m pip install --upgrade pip
   pip install -e ".[dev,docs]"
   pre-commit install
   ```

4. Create a repository on GitHub and push your code:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/your-repository-name.git
   git branch -M main
   git push -u origin main
   ```

5. Enable GitHub Actions workflows in your repository settings.
   > Go to Settings > Actions > General > Action Permissions

6. Enable GitHub Pages from GitHub Actions in your repository settings.
   > - Go to Settings > Pages > Source > GitHub Actions
   > - View your documentation at https://YOUR_USERNAME.github.io/your-repository-name

7. Add your Codecov repository token to GitHub Secrets for coverage reporting.
   > - Follow steps 1-2 in https://docs.codecov.com/docs/quick-start to get your token.
   > - Go to Settings > Secrets and variables > Actions > New repository secret
   > - Name: `CODECOV_TOKEN`; Value: `your token from Codecov`
   > - View your code coverage report at https://app.codecov.io/gh/YOUR_USERNAME/your-repository-name

8. Start developing! 🚀

## What You Get

After running cookiecutter, you'll have a complete project structure:

```
your-repository-name/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD workflows
│       ├── docs.yml        # Build and deploy documentation
│       ├── quality.yml     # Code quality checks
│       └── tests.yml       # Run tests on multiple Python versions
├── docs/                   # Sphinx documentation
│   ├── api.rst
│   ├── conf.py             # Sphinx configuration
│   ├── index.rst
│   ├── installation.rst
│   └── usage.rst
├── src/
│   └── yourpackagename/    # Your package source code
│       ├── __init__.py
│       └── py.typed        # PEP 561 type checking marker
├── tests/                  # Test files
│   ├── __init__.py
│   └── test_pkg.py         # Test for pkg metadata
├── .gitignore              # Python .gitignore
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── CONTRIBUTING.md         # Contributing guidelines
├── justfile                # Development tasks (build-docs, clean, test, etc.)
├── LICENSE                 # MIT License
├── pyproject.toml          # Modern Python project configuration
└── README.md               # Project README
```

## Included Tools and Configurations

### Code Quality

- **Ruff**: Fast all-in-one linter and formatter (replaces Black, isort, and flake8)
- **Pyright**: Fast static type checker
- **pre-commit**: Automated pre-commit hooks

### Testing & Coverage

- **pytest**: Modern testing framework
- **pytest-cov**: Code coverage reporting with XML output for Codecov
- **Coverage.py**: Detailed coverage configuration with exclusions
- **docstr-coverage**: Documentation coverage checking

### Documentation

- **Sphinx**: Documentation generator
- **PyData Sphinx Theme**: Beautiful, responsive documentation theme
- **sphinx-autodoc-typehints**: Type hints in documentation
- **Napoleon**: NumPy-style docstrings support

### Package Management

- **pip**: Traditional Python package installer (via pyproject.toml)

### CI/CD

- **Tests workflow**: Runs tests on Ubuntu, macOS, Windows with Python 3.10-3.12, uploads coverage to Codecov
- **Docs workflow**: Builds and deploys documentation to GitHub Pages
- **Lint workflow**: Runs code quality checks with ruff, type checking with pyright, and docstring coverage

### Type Checking Support

- **py.typed**: PEP 561 marker file for type checking support
- **Pyright configuration**: Basic type checking mode in pyproject.toml

### Badges

Generated projects include comprehensive badges for:
- **Build status**: Tests, documentation build, and code quality
- **Code coverage**: Codecov integration
- **PyPI**: Package version and Python version support
- **License**: MIT license badge
- **Ruff**: Ruff formatter badge

## Customization

After generating your project, you can customize it further:

- Add dependencies in `pyproject.toml`
- Modify pre-commit hooks in `.pre-commit-config.yaml`
- Update documentation theme options in `docs/conf.py`
- Add more GitHub Actions workflows as needed

## Contributing

Contributions to improve this template are welcome! Please feel free to:

- Open an issue to report bugs or suggest improvements
- Submit a pull request with enhancements

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This template is designed to follow modern Python packaging best practices and includes many tools recommended by the Python community.
