{{ cookiecutter.project_name }}
{{ '=' * cookiecutter.project_name|length }}

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/tests.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/tests.yml
   :alt: Tests

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/docs.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/docs.yml
   :alt: Documentation

.. image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/quality.yml/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/actions/workflows/quality.yml
   :alt: Code Quality

.. image:: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/branch/main/graph/badge.svg
   :target: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}
   :alt: Code Coverage

.. image:: https://badge.fury.io/py/{{ cookiecutter.package_name }}.svg
   :target: https://badge.fury.io/py/{{ cookiecutter.package_name }}
   :alt: PyPI version

.. image:: https://img.shields.io/pypi/pyversions/{{ cookiecutter.package_name }}.svg
   :target: https://pypi.org/project/{{ cookiecutter.package_name }}/
   :alt: Python Version

.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
   :target: https://opensource.org/licenses/MIT
   :alt: License

.. image:: https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json
   :target: https://github.com/astral-sh/ruff
   :alt: Ruff

.. image:: https://img.shields.io/badge/pyright-checked-brightgreen.svg
   :target: https://github.com/microsoft/pyright
   :alt: Pyright

{{ cookiecutter.project_short_description }}

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   installation
   usage
   api
   contributing

.. include:: installation.rst

.. include:: usage.rst

.. include:: api.rst

Contributing
============

See the `CONTRIBUTING.md <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}/blob/main/CONTRIBUTING.md>`_ file for guidelines on how to contribute to this project.

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
