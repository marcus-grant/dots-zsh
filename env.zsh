# This file gets called once on first bootup of user.
# If applied to root or default /etc file it gets called once on bootup.
# Good place to store core system and shell env variables.
# by Marcus Grant March 2021 CC-BY licencse

export PYENV_ROOT=$HOME/.local/pyenv
# The global default to use, if undefined default to system python
export PYENV_VERSION=3.9.4
