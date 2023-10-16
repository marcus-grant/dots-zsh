# This file gets called once on first bootup of user.
# If applied to root or default /etc file it gets called once on bootup.
# Good place to store core system and shell env variables.
# by Marcus Grant March 2021 CC-BY licencse

# Source the profile file
if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi
# TODO: Consider simplifying this &/or move to ansible controller profile file
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

# TDOO: Move these to ansible controller profile file
# Personal/user Directories (also userdirs)
export DIR_DOCS="$HOME/Documents"
export DIR_NOTE="$DIR_DOCS/notes"
export DIR_PROJ="$HOME/Projects"
export DIR_OPS="$DIR_PROJ/ops"
# TODO: Move infra to immediately inside root of ops & put seperate ansible/terra/shell dirs as siblings
export DIR_INFRA="$DIR_OPS/infra"
