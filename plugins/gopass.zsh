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