.PHONY: lint format check

# Linting target: runs all the linting tools across the entire directory
lint:
	@echo "Running flake8..."
	flake8 --max-line-length=99 . --exclude ".venv"

# Formatting target: runs all the formatting tools across the entire directory
format:

	@echo "Running isort..."
	isort . 
	@echo "Running black..."
	black . --exclude ".venv"
	

# Combined target: runs lint and format
check: format lint