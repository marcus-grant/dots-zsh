# Most used aliases that can safely go into most environments

# LS
# macOS doesn't respect --color, use -G instead
# export LS_OPTIONS='--color=auto'
if [[ "$OSTYPE" == "darwin"* ]]; then
    export LS_OPTIONS="-G"
elif [[ "$OSTYPE" == "linux"* ]]; then
    export LS_OPTIONS="--color=auto"
else
    export LS_OPTIONS=""
fi
# TODO: Remove the symlink arrows in ls, they always wrap, just show its a link
alias ls='ls "$LS_OPTIONS"'
alias l='ls -lh' # excl. hidden, human-read filesize, type annotated
alias la='l -a'  # show all files incl. hidden
alias lt='la -t'

# Grep
alias grep='grep --color=auto' # default to auto color mode
alias igrep='grep -i' # case insensitive greps
alias grep2='grep -A 2 -B 2' # case sens. search w/ 2 lines of results
alias igrep2='igrep2 -i' # same as above but case sens. (2 lines before/after)

# Tmux
# Default options
# TODO: Try out using -f to point to tmux.conf without noisy symlinks @ ~
export TMUX_OPTS='-2' # force 256color mode,
# Attaches tmux to last session
alias tm='tmux attach -t main || tmux new -s main'
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# Git
alias glog='git log --oneline --decorate --all --graph'
