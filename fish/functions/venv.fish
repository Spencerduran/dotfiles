function venv
  deactivate
  pipenv --rm
  echo "Creating a Python virtual environment in $PWD"
  pyenv shell 3.8.8
  python -m venv .venv
  source .venv/bin/activate.fish
  pip install --upgrade pip pipenv
  make install
  make install-dev
end
