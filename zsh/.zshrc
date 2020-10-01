venv() {
    echo "Creating a Python virtual environment in $(pwd)"
    pyenv local 3.6.8
    python3 -m venv .venv
    . .venv/bin/activate
    pip install --upgrade pip pipenv
}

rebuild() {
    deactivate
    pipenv --rm
    pyenv local --unset
    pyenv shell --unset
    echo "Creating a Python virtual environment in $(pwd)"
    pyenv local 3.6.8
    python3 -m venv .venv
    . .venv/bin/activate
    pip install --upgrade pip pipenv
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
