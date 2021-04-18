# GoPass plugin, handles completions and specific functions/aliases

# Helper function to load gopass completions
gopass-update-zsh-completions() {
    if ! hash gopass &> /dev/null; then
        echo "ERROR: gopass not installed! Install it to update gopass completions"
        return 1
    fi
    mkdir -p $DOTSDIRZCOMP
    gopass completion zsh > $DOTSDIRZCOMP/_gopass
}

# Alias gopass to override GNU pass command
# gopass is compatible with pass has + its own features anyhow
if hash gopass &> /dev/null; then
    alias pass='gopass'
fi

# Some nifty aliases
alias passn='pass new'
alias passh='pass show'
alias passc='pass -c'
alias passl='pass list'
alias passe='pass edit'