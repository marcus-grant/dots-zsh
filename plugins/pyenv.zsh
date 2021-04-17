# pyenv sh plugin

# NOTE: Haven't tested in clean env, pyenv might need to explicitly add
# ...PYENV_ROOT directory before initing. Delete this is not true after test
# If pyenv installed
if hash pyenv 1>/dev/null 2>&1; then
  # Clean up noise in home dir by moving pyenv using PYENV_ROOT
  export PYENV_ROOT=$HOME/.local/pyenv
  # ..and pyenv shims aren't appearing in PATH
  if [ ! "${PATH#*$PYENV_ROOT/shims}" ]; then
    # ...then init pyenv, which will among other things put shims in path
    eval "$(pyenv init -)"
  fi
fi
