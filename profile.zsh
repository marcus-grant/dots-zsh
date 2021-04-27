# Zprofile
# Because it gets called AFTER zshenv (env.zsh in dotfiles)
# this is a great place to set default values for variables if undefined

### General variables
export EDITOR="vim" # Default editor
export GPG_TTY=$(tty) # GPG needs to know what shell type is in use

### Autoloads (funcs)

### Plugin variables
