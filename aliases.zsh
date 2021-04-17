# General functions
# Most used aliases that can safely go into most environments
# Other aliases should be considered to go into its own plugin directory
# Use oh my zsh's environment as an example, here's systemd plugin below:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/systemd/systemd.plugin.zsh

### LS
# TODO: Remove the symlink arrows in ls, they always wrap, just show its a link
# macOS doesn't respect --color, use -G instead
if [[ "$OSTYPE" == "darwin"* ]]; then
    export LS_OPTIONS="-G"
elif [[ "$OSTYPE" == "linux"* ]]; then
    export LS_OPTIONS="--color=auto"
else
    export LS_OPTIONS=""
fi
alias ls='ls "$LS_OPTIONS"'
alias l='ls -a' # Compact, shows hidden
alias l1='ls -1'  # Same as ls, but 1 per line (vertical)
alias ll='la -lah' # List, hidden, human readable
alias lt='ll -t' # Same as ll, but sorted by time, newest first
alias ltr='lt -r' # Same as lt, but reverse order, oldest first
alias lz='ll -S' # Same as ll, but sorted by size, largest first
alias lzr='lt -r' # Same as lz, but reverse order, smallest first

### CD
# Store/Recall location
_STORED_PATH='./'
alias storepath='export _STORED_PATH="$(pwd)"'
alias recalpath='cd $_STORED_PATH'
# Dot / Ellipsis backwards cd
alias ..='cd ..'
alias ...='..; ..'
alias ....='...; ..'

### Grep
alias grep='grep --color=auto' # default to auto color mode
alias igrep='grep -i' # case insensitive greps
alias grep2='grep -A 2 -B 2' # case sens. search w/ 2 lines of results
alias igrep2='igrep2 -i' # same as above but case sens. (2 lines before/after)

### Editing
alias edit="$EDITOR"
alias ezrc="$EDITOR $DOTSDIRZ/zprofile"
alias ezpf="$EDITOR $DOTSDIRZ/zshrc"
alias ezal="$EDITOR $DOTSDIRZ/aliases.zsh"
alias rzrc="source $HOME/.zprofile; source $HOME/.zshrc"
alias ezfn="$EDITOR $(fd . $DOTSDIRZ/functions)"
alias sedit="sudo $EDITOR"
alias svim="sudo vim"
alias snvim="sudo nvim"
alias snano="sudo nano"
alias semacs="sudo emacs"

### Tmux
# Default options
# TODO: Try out using -f to point to tmux.conf without noisy symlinks @ ~
export TMUX_OPTS='-2' # force 256color mode,
# Attaches tmux to last session
alias tm='tmux attach -t main || tmux new -s main'
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

### Git
alias glog='git log --oneline --decorate --all --graph'
