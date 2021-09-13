###### FZF Plugins in ZSH

# TODO Make this more flexible and able to work with find, ag, etc

export FDCMD='echo fd command not found'
if command -v fdfind &> /dev/null; then
    FDCMD='fdfind'
    # export FZF_DEFAULT_COMMAND="/usr/bin/fdfind . --type file --hidden --exclude .git"
elif command -v fd &> /dev/null; then
    FDCMD='fd'
    # export FZF_DEFAULT_COMMAND="fd . --type file --hidden --exclude .git"
fi
export FZF_DEFAULT_COMMAND="$FDCMD . --type file --hidden --exclude .git"

function fcd () {
    _PWD="$(pwd)"
    DIR_ARG=$_PWD
    if [[ $# -gt 0 ]]; then
        DIR_ARG="$1"
    fi
    SELECTED_DIR=$(fd . $DIR_ARG --type directory --hidden --exclude .git | fzf)
    if [[ -d $SELECTED_DIR ]]; then
        cd $SELECTED_DIR
    else
        cd $_PWD
    fi
}

alias fcdr="fcd /"
alias fcdh="fcd $HOME"
