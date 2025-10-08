# {{ cookiecutter.project_name }}

[![Tests](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/tests.yml/badge.svg)](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/tests.yml)
[![Documentation](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/docs.yml/badge.svg)](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/docs.yml)
[![Code Quality](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/lint.yml/badge.svg)](https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/lint.yml)
[![codecov](https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/branch/main/graph/badge.svg)](https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }})
[![PyPI version](https://badge.fury.io/py/{{ cookiecutter.project_slug }}.svg)](https://badge.fury.io/py/{{ cookiecutter.project_slug }})
[![Python Version](https://img.shields.io/pypi/pyversions/{{ cookiecutter.project_slug }}.svg)](https://pypi.org/project/{{ cookiecutter.project_slug }}/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)

{{ cookiecutter.project_short_description }}

## Installation

### From PyPI

```bash
pip install {{ cookiecutter.project_slug }}
```

Or with [uv](https://github.com/astral-sh/uv):

```bash
uv pip install {{ cookiecutter.project_slug }}
```

### From Source

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
pip install -e .
```

Or with uv:

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
uv pip install -e .
```

### For Development

With pip:

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
pip install -e ".[dev]"
pre-commit install
```

Or with uv (recommended for faster installation):

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
cd {{ cookiecutter.project_slug }}
uv pip install -e ".[dev]"
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
