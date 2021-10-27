ASDF_DIR="$HOME/.local/asdf"
ASDF_COMPLETIONS="$ASDF_DIR/completions"
ASDF_CONFIG_DIR="$HOME/.config/asdf"

# Check that the ASDF_DIR location exists, if not mkdir recursive
if [[ ! -d "$ASDF_DIR" ]]; then
    mkdir -p $ASDF_DIR
fi
# Same for configs
if [[ ! -d "$ASDF_CONFIG_DIR" ]]; then
    mkdir -p $ASDF_CONFIG_DIR
fi

# Check homebrew if asdf.sh can't be found,
# could be related to brew prefixes
if [[ ! -f "$ASDF_DIR/asdf.sh" || ! -f "$ASDF_COMPLETIONS/asdf.bash" ]] && (( $+commands[brew] )); then
    echo "Attempting to update asdf with homebrew prefix"
    ASDF_DIR="$(brew --prefix asdf)"
    ASDF_COMPLETIONS="$ASDF_DIR/etc/bash_completion.bash"
fi

# Load asdf
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
    . "$ASDF_DIR/asdf.sh"

    # completions
    if [[ -f "$ASDF_COMPLETIONS/asdf.bash" ]]; then
        # TODO delete the . version if fpath works
        # . "$ASDF_COMPLETIONS/asdf.bash"
        fpath=(${ASDF_COMPLETIONS} $fpath)
    fi
fi
