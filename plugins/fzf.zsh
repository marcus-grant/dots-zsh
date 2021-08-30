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
    DIR_TO_CD="$(pwd)"
    if [[ $# -gt 0 ]]; then
        DIR_TO_CD="$1"
    fi
    DIR_TO_CD=$(fd . $DIR_TO_CD --type directory --hidden --exclude .git | fzf)
}

alias fcdr="fcd /"
alias fcdh="fcd $HOME"
