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
2. Make your changes to the template files in `{{cookiecutter.repository_name}}/`
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
   cd /tmp/test_output/my-python-package
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   python -m pip install --upgrade pip
   pip install -e ".[dev,docs]"
   pre-commit install
   ```

3. Run the checks:
   ```bash
   just quality-check
   ```

4. Verify pre-commit hooks work:
   ```bash
   just pre-commit
   ```

5. Clean up:
   ```bash
   rm -rf /tmp/test_output
   ```

## Guidelines

- Keep the template minimal and focused on best practices
- Maintain compatibility with Python 3.10+
- Document any significant changes in the template
- Ensure all generated files use proper Jinja2 templating where needed
- Test changes thoroughly before submitting

## Questions?

If you have questions about contributing, feel free to open an issue for discussion.
