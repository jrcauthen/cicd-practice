.PHONY: install lint format-check typecheck test ci build

install:
	python -m pip install --upgrade pip
	pip install -e ".[dev]"

lint:
	ruff check .

format-check:
	ruff format --check .

typecheck:
	mypy src

test:
	pytest --cov=calculator --cov-report=term-missing --cov-fail-under=90

ci: lint format-check typecheck test

build:
	python -m build