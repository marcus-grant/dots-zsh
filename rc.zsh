# Marcus Grant's ZSH Configuration
# Parts of this may be generated by my role-mydotfiles ansible role

# The following lines were added by compinstall
# General ZSH Settings
# ===============================
# Completions
zstyle ':completion:*' format 'Completing %d'
zstyle :compinstall filename '/Users/marcus/.zshrc'

# Compinit autogen'd
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Key timeouts
# I set this because vim/nvim feels sluggish in ZSH.
# ZSH apparently treats escape chars differently so needs some tweaking.
KEYTIMEOUT=1 # 1 = 10ms delay for escape chars

### Prompt
source "$DOTSDIR/zsh/configs/prompt.zsh"

### Aliases
source "$DOTSDIR/zsh/configs/aliases.zsh"

### Python - TODO: Move to zshenv or zprofile?
# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

##### Exports (many of these go in zshenv & zprofile)
export TERM="xterm-256color" # Terminal Settings