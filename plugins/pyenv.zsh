# pyenv zsh plugin
# TODO: Needs more work to be automatically installed.
# For now if pyenv isn't installed it will just default to python or python3
# I'll play around with installing using ansible for my needs.
# Later I might try to setup a more universal install approach.

# First decide where the root of all pyenv shims, binaries, libraries...
# will go. PYENV_ROOT is where pyenv looks to install itself.
# TODO: This 
if [ -z PYENV_ROOT ]; then export PYENV_ROOT=$HOME/.pyenv; fi

# First set FOUND_PYENV by checking if the command exists, will be reused
_pyenv_found=false
if (( $+commands[pyenv] )); then _pyenv_found=true; fi

# If pyenv not found, let's check directories for the usual locations
declare -a _pyenv_dirs=(
  "$PYENV_ROOT"
  "$HOME/.pyenv"
  "/usr/local/pyenv"
  "/opt/pyenv"
  "/usr/local/opt/pyenv"
)
if ! $_pyenv_found ; then # IF it wasn't found
  # Loop through all the directories one could expect pyenv in
  for _dir in $_pyenv_dirs; do
    # If something exists there...
    if [[ -d $_dir/bin ]]; then
      _pyenv_found=true
      # TODO: Remove if it is found that calling pyenv init - is enough
      # And to avoid PATH clutter, only add it if it isn't already there
      # if [ ! "${PATH#*$_dir/bin}" ]; then
      #   export PATH="$PATH:$_dir/bin"
      # fi
    fi
  done
fi

# TODO: If still not found, then install it & its virtualenv plugin

# Now run pyenv init - if found
if $_pyenv_found; then
  if [[ ! $PATH == *"PYENV_ROOT/shims"* ]]; then
    eval "$(pyenv init -)"
  fi
  if (( $+commands[pyenv-virtualenv-init] )); then
    # Don't execute virtualenv init if it's already in PATH
    if [[ ! $PATH == *"/opt/homebrew/Cellar/pyenv-virualenv"* ]]; then
      eval "$(pyenv virtualenv-init -)"
    fi
  fi
  function pyenv_prompt_info() { echo "$(pyenv version-name)" }
else
  # Fallback to system python
  function pyenv_prompt_info() {
    echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')"
  }
fi

# NOTE: Haven't tested in clean env, pyenv might need to explicitly add
# ...PYENV_ROOT directory before initing. Delete this is not true after test
# If pyenv installed
# if hash pyenv 1>/dev/null 2>&1; then
#   # Clean up noise in home dir by moving pyenv using PYENV_ROOT
#   export PYENV_ROOT=$HOME/.local/pyenv
#   # ..and pyenv shims aren't appearing in PATH
#   if [ ! "${PATH#*$PYENV_ROOT/shims}" ]; then
#     # ...then init pyenv, which will among other things put shims in path
#     eval "$(pyenv init -)"
#   fi
# fi

#

unset _pyenv_found _pyenv_dirs _dir
