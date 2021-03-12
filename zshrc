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


# Aliases
# ==============================
source base-configs/aliases.zsh

### CD
# Store/Recall location
_STORED_PATH='./'
alias storepath='export _STORED_PATH="$(pwd)"'
alias recalpath='cd $_STORED_PATH'

# Dot / Ellipsis backwards cd
alias ..='cd ..'
alias ...='..; ..'
alias ....='...; ..'

### Python
# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

##### Exports (many of these go in zshenv & zprofile)
export TERM="xterm-256color" # Terminal Settings
