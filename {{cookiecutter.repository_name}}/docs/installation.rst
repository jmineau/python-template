Installation
============

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
   python -m pip install --upgrade pip
   pip install -e ".[dev,docs]"
   pre-commit install

Requirements
------------

- Python 3.10 or higher
