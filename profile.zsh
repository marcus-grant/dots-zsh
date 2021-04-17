# Zprofile

### General variables
export EDITOR="vim" # Default editor
export GPG_TTY=$(tty) # GPG needs to know what shell type is in use

### Dotfiles Environment Vars
export DOTSDIR="$HOME/.dots" # A useful variable to point to dotfiles dir
export DOTSDIRZ="$DOTSDIR/zsh"
export DOTSDIRZCOMP="$DOTSDIRZ/completions"
export DOTSDIRZFUNC="$DOTSDIRZ/functions"
export DOTSDIRZPLUG="$DOTSDIRZ/plugins"

### Paths
# Homebrew package binaries
[ "${PATH#*/opt/homebrew/bin}" ] && export PATH="/opt/homebrew/bin:$PATH"
fpath+=$DOTSDIRZCOMP
fpath+=$DOTSDIRZFUNC

# Autoloads (funcs)