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
fpath+=$DOTSDIRZCOMP
fpath+=$DOTSDIRZFUNC

### Defaults
export EDITOR=vim

# PATH
export PATH="$PATH:$HOME/.local/bin"

# Langs
export PATH="$PATH:$HOME/.cargo/bin"
# The global default to use, if undefined default to system python
export PYENV_VERSION=3.9.4
