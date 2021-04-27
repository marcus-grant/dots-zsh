# Zprofile
# Because it gets called AFTER zshenv (env.zsh in dotfiles)
# this is a great place to set default values for variables if undefined

### General variables
export EDITOR="vim" # Default editor
export GPG_TTY=$(tty) # GPG needs to know what shell type is in use

### Dotfiles Environment Vars - Expanded from env.zsh definitions
export DOTSDIR="$HOME/.dots" # A useful variable to point to dotfiles dir
export DOTSDIRZ="$DOTSDIR/zsh"
export DOTSDIRZCOMP="$DOTSDIRZ/completions"
export DOTSDIRZFUNC="$DOTSDIRZ/functions"
export DOTSDIRZPLUG="$DOTSDIRZ/plugins"

### Paths (builtins)
# Homebrew package binaries
fpath+=$DOTSDIRZCOMP
fpath+=$DOTSDIRZFUNC

### Autoloads (funcs)

### Plugin variables
