{{ cookiecutter.project_name }}
{{ '=' * cookiecutter.project_name|length }}

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
