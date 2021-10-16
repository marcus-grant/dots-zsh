# Make Hetzner's hcloud API interface completions work for ZSH
if [ ! -d ~/.config/hcloud/completion/zsh ]; then
    mkdir -p ~/.config/hcloud/completion/zsh
fi

if command -v hcloud &> /dev/null; then
    hcloud completion zsh > ~/.config/hcloud/completion/zsh/_hcloud
fi
    
