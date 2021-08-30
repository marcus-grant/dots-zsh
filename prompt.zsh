# A starship based prompt with bells and whistles

# Install starship if not detected
if ! command -v starship &> /dev/null; then
  msg="ATTENTION: BASH prompt uses starship to render itself & it isnt installed!"
  msg="$msg\nInstalling starship now, you'll get a chance to cancel it."
  echo
  echo -e "\e[1;33m$msg\e[0m"
  echo
  echo "NOTE: It's possible to use the basic bash prompt by..."
  echo "...sourcing that prompt file instead withing .bashrc"
  echo
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# Start starship
eval "$(starship init zsh)"
