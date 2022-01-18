# Make Hetzner's hcloud API interface completions work for ZSH
if [ ! -d ~/.config/hcloud/completion/zsh ]; then
    mkdir -p ~/.config/hcloud/completion/zsh
fi

if command -v hcloud &> /dev/null; then
    hcloud completion zsh > ~/.config/hcloud/completion/zsh/_hcloud
fi

fpath+=(~/.config/hcloud/completion/zsh)
autoload -Uz compinit; compinit
    
# Load hcloud into its own token variable for molecule & scripts
# -v flag will print it
function hcloud-token () {
  echo "$(pass show dev/hetzner-token 2> /dev/null | tail -n 1)"
}

# Load env var for HCLOUD_TOKEN if it can be acquired
export HCLOUD_TOKEN=$(hcloud-token)
if [[ ${#HCLOUD_TOKEN} -lt 32 ]]; then
  if [[ ${#HCLOUD_TOKEN} -gt 68 ]]; then
    unset HCLOUD_TOKEN
  fi
fi
