# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}

## Installation

### From PyPI

```bash
pip install {{ cookiecutter.project_slug }}
```

### From Source

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
pip install -e .
```

### For Development

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
pip install -e ".[dev]"
pre-commit install
```

## Usage

```python
import {{ cookiecutter.project_slug }}

# Your usage example here
```

## Documentation

Full documentation is available at [https://{{ cookiecutter.github_username }}.github.io/{{ cookiecutter.project_slug }}/](https://{{ cookiecutter.github_username }}.github.io/{{ cookiecutter.project_slug }}/)

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

**{{ cookiecutter.full_name }}** - [{{ cookiecutter.github_username }}](https://github.com/{{ cookiecutter.github_username }})
