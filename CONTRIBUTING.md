# Contributing to cookiecutter-python

Thank you for considering contributing to this cookiecutter template!

## Reporting Issues

If you find any issues with the template or have suggestions for improvements, please:

1. Check if a similar issue already exists
2. Open a new issue describing the problem or suggestion
3. Include examples of what's not working or how it could be improved

## Proposing Changes

To propose changes to the template:

1. Fork the repository
2. Make your changes to the template files in `{{cookiecutter.project_slug}}/`
3. Test your changes by generating a new project:
   ```bash
   cookiecutter path/to/your/fork --no-input
   ```
4. Verify the generated project works as expected
5. Submit a pull request with a clear description of your changes

## Testing Changes

Before submitting a pull request, please:

1. Generate a test project:
   ```bash
   cookiecutter . --no-input --output-dir /tmp/test_output
   ```

2. Verify the generated project can be installed:
   ```bash
   cd /tmp/test_output/my_python_package
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install -e ".[dev]"
   ```

3. Run the tests:
   ```bash
   pytest
   ```

4. Verify pre-commit hooks work:
   ```bash
   pre-commit run --all-files
   ```

5. Clean up:
   ```bash
   rm -rf /tmp/test_output
   ```

## Template Structure

- `cookiecutter.json`: Template configuration and default values
- `{{cookiecutter.project_slug}}/`: The template directory (gets renamed based on user input)
  - `.github/workflows/`: CI/CD workflows
  - `docs/`: Sphinx documentation structure
  - `src/{{cookiecutter.project_slug}}/`: Package source code (with py.typed)
  - `tests/`: Test files
  - Configuration files (`.pre-commit-config.yaml`, `pyproject.toml`, etc.)

## Guidelines

- Keep the template minimal and focused on best practices
- Maintain compatibility with Python 3.10+
- Document any significant changes in the template
- Ensure all generated files use proper Jinja2 templating where needed
- Test changes thoroughly before submitting

## Questions?

If you have questions about contributing, feel free to open an issue for discussion.
