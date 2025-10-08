"""Test basic functionality of {{ cookiecutter.project_slug }}."""

import {{ cookiecutter.project_slug }}


def test_version():
    """Test that version is defined."""
    assert hasattr({{ cookiecutter.project_slug }}, "__version__")
    assert isinstance({{ cookiecutter.project_slug }}.__version__, str)


def test_author():
    """Test that author is defined."""
    assert hasattr({{ cookiecutter.project_slug }}, "__author__")
    assert isinstance({{ cookiecutter.project_slug }}.__author__, str)


def test_email():
    """Test that email is defined."""
    assert hasattr({{ cookiecutter.project_slug }}, "__email__")
    assert isinstance({{ cookiecutter.project_slug }}.__email__, str)
