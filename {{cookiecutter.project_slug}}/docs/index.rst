{{ cookiecutter.project_name }}
{{ '=' * cookiecutter.project_name|length }}

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/tests.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/tests.yml
   :alt: Tests

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/docs.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/docs.yml
   :alt: Documentation

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/lint.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions/workflows/lint.yml
   :alt: Code Quality

.. image:: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/branch/main/graph/badge.svg
   :target: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}
   :alt: Code Coverage

.. image:: https://badge.fury.io/py/{{ cookiecutter.project_slug }}.svg
   :target: https://badge.fury.io/py/{{ cookiecutter.project_slug }}
   :alt: PyPI version

.. image:: https://img.shields.io/pypi/pyversions/{{ cookiecutter.project_slug }}.svg
   :target: https://pypi.org/project/{{ cookiecutter.project_slug }}/
   :alt: Python Version

.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
   :target: https://opensource.org/licenses/MIT
   :alt: License

.. image:: https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json
   :target: https://github.com/astral-sh/ruff
   :alt: Ruff

{{ cookiecutter.project_short_description }}

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   installation
   usage
   api
   contributing

Installation
============

.. include:: installation.rst

Usage
=====

.. include:: usage.rst

API Reference
=============

.. include:: api.rst

Contributing
============

See the `CONTRIBUTING.md <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/blob/main/CONTRIBUTING.md>`_ file for guidelines on how to contribute to this project.

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
