# General functions, aliases and variables
#===============================================================================
# Time
# ------------------------------------------------------------------------------
# Timestamp function that returns the current time in the format:
# YYYY-mm-ddTHH:MM:SSZ
timestamp-iso() {
    _DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    echo $_DATE
}
alias timestamp='timestamp-iso'
alias tstamp='timestamp-iso'
# Timestamp function that
# returns a more filesystem friendly version of ISO timestamps:
# YYYY-mm-ddTHH-MM-SSZ
timestamp-fs() {
    echo "$( timestamp-iso | sed 's/:/-/g' )"
}
alias timestampfs='timestamp-fs'
alias tstampfs='timestamp-fs'
# Timestamp function getting the shortest full version of
# iso data timestamp YYYYmmdd (local)
timestamp-short() {
    echo "$(date +"%Y%m%d")"
}
alias timestampshort='timestamp-short'
alias tstampshort='timestamp-short'
alias tstampsh='timestamp-short'
# Timestamp function getting only current week of year (local)
timestamp-week() {
    echo "$(date +"%W")"
}
alias timestampwk='timestamp-week'
alias tstampwk='timestamp-week'
alias week='timestamp-week'
alias wk='timestamp-week'

# atuin # TODO: Respect XDG_CONFIG_HOME and .local/bin
source "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
