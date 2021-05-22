# Zprofile
# Because it gets called AFTER zshenv (env.zsh in dotfiles)
# this is a great place to set default values for variables if undefined

# Before anything else make sure zsh env vars have been set
if [ -z $DOTSDIR ]; then source ~/.zshenv; fi

### General variables
export EDITOR="vim" # Default editor
export GPG_TTY=$(tty) # GPG needs to know what shell type is in use

### Autoloads (funcs)

### Plugin variables
