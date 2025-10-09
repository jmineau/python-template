Installation
============

From PyPI
---------

The easiest way to install {{ cookiecutter.project_name }} is using pip:

.. code-block:: bash

   pip install {{ cookiecutter.package_name }}

From Source
-----------

To install from source:

.. code-block:: bash

   git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}.git
   cd {{ cookiecutter.repository_name }}
   pip install -e .

Development Installation
------------------------

For development, install with the development dependencies:

.. code-block:: bash

   git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}.git
   cd {{ cookiecutter.repository_name }}
   pip install -e ".[dev]"
   pre-commit install

Requirements
------------

- Python 3.10 or higher
