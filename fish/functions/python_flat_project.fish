function python_flat_project
    # Get project name from the current directory
    set PROJECT_NAME (basename (pwd))
    echo "Creating basic Python project structure for: $PROJECT_NAME"

    # Create minimal directory structure
    mkdir -p $PROJECT_NAME
    mkdir -p $PROJECT_NAME/data/input
    mkdir -p $PROJECT_NAME/data/output
    mkdir -p tests

    # Create __init__.py files
    touch $PROJECT_NAME/__init__.py
    touch $PROJECT_NAME/data/__init__.py
    touch tests/__init__.py

    # Create main.py
    echo '"""Main module."""

def main():
    """Run the main function."""
    print("Hello from '$PROJECT_NAME'!")

if __name__ == "__main__":
    main()' > $PROJECT_NAME/main.py

    # Create setup.py
    echo 'from setuptools import setup, find_packages

setup(
    name="'$PROJECT_NAME'",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        # Add your dependencies here
    ],
)' > setup.py

    # Create README.md
    echo "# $PROJECT_NAME" > README.md

    # Create a test file
    echo '"""Test for main module."""

from '$PROJECT_NAME'.main import main

def test_main():
    """Test the main function."""
    assert True' > tests/test_main.py

    # Create virtual environment
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

# Data files
$PROJECT_NAME/data/output/*
!$PROJECT_NAME/data/output/.gitkeep' > .gitignore

    # Add .gitkeep files
    touch $PROJECT_NAME/data/input/.gitkeep
    touch $PROJECT_NAME/data/output/.gitkeep

    echo "Basic Python project structure created successfully!"
    echo "To activate the virtual environment, run: source .venv/bin/activate.fish"
end
