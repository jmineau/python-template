Installation
============

From PyPI
---------

The easiest way to install {{ cookiecutter.project_name }} is using pip:

.. code-block:: bash

   pip install {{ cookiecutter.project_slug }}

From Source
-----------

To install from source:

.. code-block:: bash

   git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
   cd {{ cookiecutter.project_slug }}
   pip install -e .

Development Installation
------------------------

For development, install with the development dependencies:

.. code-block:: bash

   git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}.git
   cd {{ cookiecutter.project_slug }}
   pip install -e ".[dev]"
   pre-commit install

Requirements
------------

- Python {{ cookiecutter.python_version }} or higher
