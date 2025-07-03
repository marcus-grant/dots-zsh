# General functions
# Most used aliases that can safely go into most environments
# Other aliases should be considered to go into its own plugin directory
# Use oh my zsh's environment as an example, here's systemd plugin below:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/systemd/systemd.plugin.zsh

### General
clr='clear' # Clear the terminal

### LS
# TODO: Remove the symlink arrows in ls, they always wrap, just show its a link
# macOS doesn't respect --color, use -G instead
### LS
# TODO: Remove the symlink arrows in ls, they always wrap, just show its a link
# macOS doesn't respect --color, use -G instead
if [[ "$OSTYPE" == "darwin"* ]]; then
    # DELETEME if ls aliases work on all systems
    # export LS_OPTIONS="-G"
    alias ls="ls $LS_OPTIONS"
elif [[ "$OSTYPE" == "linux"* ]]; then
    # DELETEME if ls aliases work on all systems
    # export LS_OPTIONS="--color=auto --group-directories-first"
    alias ls="ls $LS_OPTIONS"
else
    # export LS_OPTIONS="" # DELETEME if ls aliases work on all systems
    alias ls="ls"
fi
# alias ls="ls $LS_OPTIONS" # DELETEME if we stick with conditional aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
    export LS_OPTIONS="-G"
elif [[ "$OSTYPE" == "linux"* ]]; then
    # DELETEME: ??? group-dir-first not an option anymore?
    # export LS_OPTIONS="--color=auto --group-directories-first"
    export LS_OPTIONS="--color=auto"
else
    export LS_OPTIONS=""
fi
alias ls='ls "$LS_OPTIONS"'
alias l='ls -a' # Compact, shows hidden
alias l1='ls -1'  # Same as ls, but 1 per line (vertical)
alias la='ls -AF' # Like l (compact) but with filetype symbols
alias ll='ls -lah' # List, hidden, human readable
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
alias grepi='grep -i' # case insensitive greps
alias grep2='grep -A 2 -B 2' # case sens. search w/ 2 lines of results
alias grepi2='igrep2 -i' # same as above but case sens. (2 lines before/after)

### Find/FD
if command -v fdfind &> /dev/null; then
    alias fd='fdfind'
fi

### Clipboard
# Clipboard aliases for Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if command -v wl-copy &>/dev/null && command -v wl-paste &>/dev/null; then
    alias cc='wl-copy'
    # alias cv='wl-paste' # NOTE: This can cause issues when piping or cat'ing ambiguous types
    alias cv='wl-paste --no-newline --type text/plain'
  elif command -v xclip &>/dev/null; then
    alias cc='xclip -selection clipboard'
    alias cv='xclip -selection clipboard -o'
  else
    echo "No compatible clipboard manager found. Install 'wl-clipboard' or 'xclip'." >&2
  fi
fi

### Editing
alias edit="$EDITOR"
alias ezrc="$EDITOR $DOTSDIRZ/profile.zsh"
alias ezpf="$EDITOR $DOTSDIRZ/rc.zsh"
alias ezal="$EDITOR $DOTSDIRZ/aliases.zsh"
alias rzrc="source $DOTSDIRZ/profile.zsh; source $DOTSDIRZ/env.zsh; source $DOTSDIRZ/rc.zsh"
alias sedit="sudo $EDITOR"
alias svim="sudo vim"
alias snvim="sudo nvim"
alias snano="sudo nano"
alias semacs="sudo emacs"
#### NeoVim
if ! command -v nvim &> /dev/null; then
    if [ -x ~/.local/bin/nvim.appimage ]; then
        alias nvim="$HOME/.local/bin/nvim.appimage"
    fi
fi

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

### Pass/PWGen/password stuff
alias pwgen16='pwgen -ncy 16 1'

### Misc.
## SQLite
# Check for sqlite3 or sqlite command and shorten to sqlt
if command -v sqlite3 >/dev/null 2>&1; then
  alias sqlt='sqlite3'
elif command -v sqlite >/dev/null 2>&1; then
    alias sqlt='sqlite'
fi 
