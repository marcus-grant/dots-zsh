# The following lines were added by compinstall

zstyle ':completion:*' format 'Completing %d'
zstyle :compinstall filename '/Users/marcus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

###### Aliases
### LS
# Something's up with macOS --color option in ls
# export LS_OPTIONS='--color=auto'
export LS_OPTIONS='-G'
alias ls='ls "$LS_OPTIONS"'
alias l='ls -lhG'
alias la='l -aG'
alias lt='la -t'

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

##### Exports
export EDITOR='vim' # Default editor
export TERM="xterm-256color" # Terminal Settings
