###### FZF Plugins in ZSH

# TODO Make this more flexible and able to work with find, ag, etc

export FDCMD='echo fd command not found'
if command -v fdfind &> /dev/null; then
    FDCMD='fdfind'
    alias fd='fdfind'
    # export FZF_DEFAULT_COMMAND="/usr/bin/fdfind . --type file --hidden --exclude .git"
elif command -v fd &> /dev/null; then
    FDCMD='fd'
    # export FZF_DEFAULT_COMMAND="fd . --type file --hidden --exclude .git"
fi
export FZF_DEFAULT_COMMAND="$FDCMD . --type file --hidden --exclude .git --exclude node_modules --exclude .venv --exclude venv"

function fcd () {
    _PWD="$(pwd)"
    DIR_ARG=$_PWD
    if [[ $# -gt 0 ]]; then
        DIR_ARG="$1"
    fi
    SELECTED_DIR=$(fd . $DIR_ARG --type directory --no-ignore --hidden \
        --exclude .git \
        --exclude node_modules \
        --exclude venv --exclude .venv \
        --exclude Library/Containers \
        --exclude Library/Group\ Containers \
        --exclude Library/Caches \
    | fzf)
    if [[ -d $SELECTED_DIR ]]; then
        cd $SELECTED_DIR
    else
        cd $_PWD
    fi
    # TODO DELETEME This seems like a bug, if fcd works as expected delete this
    # DIR_TO_CD=$(fd . $DIR_TO_CD --type directory --hidden --exclude .git | fzf)
    # cd $DIR_TO_CD
}

alias fcdr="fcd /"
alias fcdh="fcd $HOME"
