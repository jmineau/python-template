"""Test basic functionality of {{ cookiecutter.package_name }}."""

import {{ cookiecutter.package_name }}


def test_version():
    """Test that version is defined."""
    assert hasattr({{ cookiecutter.package_name }}, "__version__")
    assert isinstance({{ cookiecutter.package_name }}.__version__, str)


def test_author():
    """Test that author is defined."""
    assert hasattr({{ cookiecutter.package_name }}, "__author__")
    assert isinstance({{ cookiecutter.package_name }}.__author__, str)


def test_email():
    """Test that email is defined."""
    assert hasattr({{ cookiecutter.package_name }}, "__email__")
    assert isinstance({{ cookiecutter.package_name }}.__email__, str)
