###### FZF Plugins in ZSH

# TODO Make this more flexible and able to work with find, ag, etc

export FZF_DEFAULT_COMMAND="fd . --hidden --exclude .git"

alias fcd='cd $(fd . --type directory --hidden | fzf)'
alias fcdh='cd $(fd . ~ --type directory --hidden | fzf)'
alias fcdr='cd $(fd . / --type directory --hidden | fzf)'
