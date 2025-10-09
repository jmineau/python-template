# Makefile for {{ cookiecutter.project_name }}

.PHONY: help setup clean coverage lint check docs pre-commit

help:
	@echo "Available targets:"
	@echo "  setup      - Set up development environment"
	@echo "  clean      - Remove build artifacts and cache files"
	@echo "  coverage   - Run tests with coverage report"
	@echo "  lint       - Run ruff to fix code issues"
	@echo "  check      - Run ruff check and pytest tests"
	@echo "  docs       - Build HTML documentation"
	@echo "  pre-commit - Run pre-commit hooks on all files"

setup:
	@echo "Setting up development environment..."
	pip install -e ".[dev,docs]"
	pre-commit install
	@echo "Setup complete!"

clean:
	@echo "Cleaning up generated files..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache/
	rm -rf .ruff_cache/
	rm -rf htmlcov/
	rm -rf .coverage
	rm -rf coverage.xml
	rm -rf docs/build/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.pyo' -delete
	@echo "Clean complete!"

coverage:
	@echo "Running tests with coverage..."
	pytest --cov={{ cookiecutter.package_name }} --cov-report=term-missing --cov-report=html --cov-report=xml

lint:
	@echo "Running ruff to fix code issues..."
	ruff check --fix src/{{ cookiecutter.package_name }} tests/
	ruff format src/{{ cookiecutter.package_name }} tests/

check:
	@echo "Running ruff check..."
	ruff check src/{{ cookiecutter.package_name }} tests/
	@echo "Running tests..."
	pytest -v

docs:
	@echo "Building HTML documentation..."
	sphinx-build -M html docs/source docs/build

pre-commit:
	@echo "Running pre-commit on all files..."
	pre-commit run --all-files
