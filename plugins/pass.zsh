# Password and identity management functions

# Utility
# -------

# TODO: This needs work, can't get it to properly wrap

# Securely edit a file using EDITOR_SECURE or temporarily set EDITOR for a wrapped command
# Default behavior: Directly opens the editor specified in EDITOR_SECURE
# Wrapped behavior: Uses EDITOR_SECURE as EDITOR to execute a command if '--' is provided
# function edit-secure() {
#     # Capture the current EDITOR value
#     local EDITOR_OLD="$EDITOR"
# 
#     # Ensure premature exit restores the original EDITOR
#     trap 'EDITOR="$EDITOR_OLD"' EXIT
#     trap 'EDITOR="$EDITOR_OLD"' SIGINT SIGTERM
# 
#     # Check if EDITOR_SECURE is set
#     if [ -z "$EDITOR_SECURE" ]; then
#         # If not, prompt for a value to set
#         echo "No EDITOR_SECURE set. To avoid this prompt, define EDITOR_SECURE in your shell profile."
#         read -p "Enter editor to use for secure editing: " EDITOR_SECURE
#     fi
# 
#     # Check if '--' delimiter is present
#     if [[ "$1" == "--" ]]; then
#         shift  # Remove the '--' from arguments
#         export EDITOR="$EDITOR_SECURE"
#         # Execute the remaining arguments as a command with EDITOR set to EDITOR_SECURE
#         "$@"
#     else
#         # Default behavior: Directly use EDITOR_SECURE to open the file with all arguments
#         "$EDITOR_SECURE" "$@"
#     fi
# 
#     # The trap will restore EDITOR to its original value
#     return 0
# }


# Pass (password-store) based functions
# -------------------------------------

# Use different, less leaky editor with 'pass edit'
# TODO: Doesnt work without fixes to edit-secure
# function passedit() {
#     echo "$@"
#     edit-secure -- pass edit "$@"
# }
