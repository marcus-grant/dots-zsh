# Zprofile

# General variables
export EDITOR="vim" # Default editor
export GPG_TTY=$(tty) # GPG needs to know what shell type is in use

# Dotfiles Environment Vars
export DOTSDIR="$HOME/.dots" # A useful variable to point to dotfiles dir
export DOTSDIRZ="$DOTSDIR/zsh"
export DOTSDIRZCOMP="$DOTSDIRZ/completions"
export DOTSDIRZFUNC="$DOTSDIRZ/functions"

# Paths
export PATH="/opt/homebrew/bin:$PATH" # Homebrew bin
# fpath=+/$DOTSDIRZCOMP

# # Completions
# # GoPass
# if [ ! -d $DOTSDIRZCOMP/_gopass ]; then
#     if (( $+commands[gopass] )); then
#         gopass completion zsh > $DOTSDIRZCOMP/_gopass
#     fi
# fi
