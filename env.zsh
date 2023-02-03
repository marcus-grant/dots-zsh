# This file gets called once on first bootup of user.
# If applied to root or default /etc file it gets called once on bootup.
# Good place to store core system and shell env variables.
# by Marcus Grant March 2021 CC-BY licencse

### Dotfiles Environment Vars - Expanded from env.zsh definitions
export DOTSDIR="$HOME/.config" # A useful variable to point to dotfiles dir
export DOTSDIRZ="$DOTSDIR/zsh" # ZDOTDIR is a ZSH var sets search for configs
export DOTSDIRZCOMP="$DOTSDIRZ/completions"
export DOTSDIRZFUNC="$DOTSDIRZ/functions"
export DOTSDIRZPLUG="$DOTSDIRZ/plugins"
export PYENV_ROOT=$HOME/.local/pyenv

### Paths (builtins)
# Homebrew package binaries
# NOTE: Is this what gets used to index completions???
fpath+=$DOTSDIRZCOMP
fpath+=$DOTSDIRZFUNC

### Defaults
export EDITOR=vim

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PATH
export PATH="$PATH:$HOME/.local/bin"

# LSCOLORS
if [[ 'darwin' == *"$OSTYPE"* ]]; then
    export LS_COLORS="cxexfxdxBxEhebAbAgAcAd"
else
    export LS_COLORS="di=32:ln=34:so=35:pi=33:ex=1;31:bd=1;34;47:cd=34;41:su=1;30;41:sg=1;30;46:tw=1;30;42:ow=1;30;43"
fi

# Programming / Runtimes
export PATH="$PATH:$HOME/.cargo/bin"
# The global default to use, if undefined default to system python
export PYENV_VERSION=3.10.7


# Personal/user Directories (also userdirs)
export DIR_DOCS="$HOME/Documents"
export DIR_NOTE="$DIR_DOCS/notes"
export DIR_PROJ="$HOME/Projects"
export DIR_OPS="$DIR_PROJ/ops"
# TODO: Move infra to immediately inside root of ops & put seperate ansible/terra/shell dirs as siblings
export DIR_INFRA="$DIR_OPS/infra"

# Load secrets last
if [ -f $DOTSDIRZ/secrets.zsh ]; then
    source $DOTSDIRZ/secrets.zsh
fi

