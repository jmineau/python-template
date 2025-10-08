# cookiecutter-python

A [Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for creating modern Python packages with best practices built-in.

## Features

This template provides a complete Python package structure with:

- 📦 **Modern Python packaging** with `pyproject.toml`
- 🎨 **Code formatting** with Black (pre-commit hooks included)
- ✅ **Pre-commit hooks** for automated code quality checks
- 📚 **Sphinx documentation** with PyData theme
- 🧪 **Testing setup** with pytest and coverage
- 🤝 **Contributing guidelines** for open source collaboration
- 🔧 **GitHub Actions workflows** for CI/CD
- 📝 **Python .gitignore** with sensible defaults

## Requirements

- Python 3.8 or higher
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

You'll be prompted to enter values for your new project:

- `full_name`: Your full name
- `email`: Your email address
- `github_username`: Your GitHub username
- `project_name`: The name of your project (e.g., "My Python Package")
- `project_slug`: The package name (auto-generated from project_name)
- `project_short_description`: A brief description of your project
- `version`: Initial version (default: 0.1.0)
- `python_version`: Minimum Python version (default: 3.8)

### After Generation

Once your project is generated, follow these steps:

1. Navigate to your new project directory:
   ```bash
   cd your_project_slug
   ```

2. Initialize a git repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit from cookiecutter-python"
   ```

3. Create a virtual environment and install dependencies:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install -e ".[dev]"
   ```

4. Set up pre-commit hooks:
   ```bash
   pre-commit install
   ```

5. Create a repository on GitHub and push your code:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/your_project_slug.git
   git branch -M main
   git push -u origin main
   ```

6. Start developing! 🚀

## What You Get

After running cookiecutter, you'll have a complete project structure:

```
your_project_slug/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD workflows
│       ├── tests.yml       # Run tests on multiple Python versions
│       ├── docs.yml        # Build and deploy documentation
│       └── lint.yml        # Code quality checks
├── docs/                   # Sphinx documentation
│   ├── conf.py
│   ├── index.rst
│   ├── installation.rst
│   ├── usage.rst
│   ├── api.rst
│   ├── Makefile
│   └── make.bat
├── src/
│   └── your_project_slug/  # Your package source code
│       └── __init__.py
├── tests/                  # Test files
│   ├── __init__.py
│   └── test_basic.py
├── .gitignore              # Python .gitignore
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── CONTRIBUTING.md         # Contributing guidelines
├── LICENSE                 # MIT License
├── pyproject.toml          # Modern Python project configuration
└── README.md               # Project README
```

## Included Tools and Configurations

### Code Quality

- **Black**: Opinionated code formatter with 88-character line length
- **isort**: Import sorting (configured for Black compatibility)
- **flake8**: Linting
- **pre-commit**: Automated pre-commit hooks for all the above

### Testing

- **pytest**: Modern testing framework
- **pytest-cov**: Coverage reporting

### Documentation

- **Sphinx**: Documentation generator
- **PyData Sphinx Theme**: Beautiful, responsive documentation theme
- **sphinx-autodoc-typehints**: Type hints in documentation
- **Napoleon**: NumPy-style docstrings support

### CI/CD

- **Tests workflow**: Runs tests on multiple Python versions and OS
- **Docs workflow**: Builds and deploys documentation to GitHub Pages
- **Lint workflow**: Runs code quality checks

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
