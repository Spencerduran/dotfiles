function python_boilerplate
    # Get project name from the current directory
    set PROJECT_NAME (basename (pwd))
    echo "Creating Python project structure for: $PROJECT_NAME"

    # Create directory structure
    mkdir -p src/$PROJECT_NAME
    mkdir -p tests
    mkdir -p docs
    mkdir -p scripts

    # Create basic Python package files
    touch src/$PROJECT_NAME/__init__.py
    touch src/$PROJECT_NAME/main.py

    # Create test files
    touch tests/__init__.py
    touch tests/test_main.py

    # Create README and other documentation
    echo "# $PROJECT_NAME" > README.md
    echo "Documentation for $PROJECT_NAME" > docs/index.md

    # Create setup files - fish uses a different approach for heredocs
    echo '[build-system]
requires = ["setuptools>=42", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "'$PROJECT_NAME'"
version = "0.1.0"
description = "A description for '$PROJECT_NAME'"
readme = "README.md"
authors = [
    {name = "Your Name", email = "your.email@example.com"}
]
license = {text = "MIT"}
requires-python = ">=3.8"
classifiers = [
    "Programming Language :: Python :: 3",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "black>=23.0.0",
    "isort>=5.0.0",
    "mypy>=1.0.0",
]

[tool.black]
line-length = 88

[tool.isort]
profile = "black"

[tool.mypy]
python_version = "3.8"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true
disallow_incomplete_defs = true' > pyproject.toml

    # Create sample main.py content
    echo '"""Main module."""

def main():
    """Run the main function."""
    print("Hello, world!")

if __name__ == "__main__":
    main()' > src/$PROJECT_NAME/main.py

    # Create sample test_main.py content
    echo '"""Tests for main module."""

from '$PROJECT_NAME'.main import main

def test_main():
    """Test the main function."""
    # This is just a placeholder test
    assert True' > tests/test_main.py

    # Create a virtual environment
    echo "Creating virtual environment..."
    python -m venv .venv

    # Create .gitignore
    echo '# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
dist/
build/
*.egg-info/

# Virtual environments
.venv/
venv/
ENV/

# Testing
.pytest_cache/
.coverage

# Editors
.vscode/
.idea/
*.swp
*.swo

# OS specific
.DS_Store' > .gitignore

    echo "Python project structure created successfully!"
    echo "To activate the virtual environment, run: source .venv/bin/activate.fish"
end
