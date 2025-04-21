#!/usr/bin/env fish

function new_python_project
    set project_name $argv[1]

    if test -z "$project_name"
        echo "Error: Please provide a project name"
        return 1
    end

    # Create root project directory
    mkdir -p $project_name
    cd $project_name

    # Create main project structure
    mkdir -p src/$project_name tests data/inputs data/outputs

    # Create __init__.py files
    touch src/$project_name/__init__.py
    touch tests/__init__.py

    # Create basic Python files
    touch src/$project_name/main.py
    touch src/$project_name/core.py
    touch src/$project_name/utils.py

    # Create test files
    touch tests/test_main.py
    touch tests/test_core.py

    # Create .gitkeep files for empty data directories
    touch data/inputs/.gitkeep
    touch data/outputs/.gitkeep

    # Create standard project files
    echo "# $project_name" > README.md
    touch requirements.txt
    touch setup.py
    echo "__pycache__/\n*.py[cod]\n*\$py.class\n.env\nvenv/\nenv/\n.DS_Store" > .gitignore

    echo "Project structure for '$project_name' created successfully!"

    # Show the created structure
    find . -type f -o -type d | sort
end

new_python_project $argv
