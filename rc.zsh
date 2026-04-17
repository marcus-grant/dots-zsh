# Marcus Grant's ZSH Configuration

# Ensure zshenv has been sourced (DOTSDIR must be set before anything else)
if [ -z "$DOTSDIR" ]; then source ~/.zshenv; fi

# Completion styles
zstyle ':completion:*' format 'Completing %d'
zstyle :compinstall filename "$DOTSDIRZ/rc.zsh"

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

# Escape timeout — keep vim/nvim in zsh from feeling sluggish (1 = 10ms)
KEYTIMEOUT=1

# Prompt, aliases, plugins
source "$DOTSDIRZ/prompt.zsh"
source "$DOTSDIRZ/aliases.zsh"
source "$DOTSDIRZPLUG/general.zsh"
source "$DOTSDIRZPLUG/fzf.zsh"
source "$DOTSDIRZPLUG/pass.zsh"
source "$DOTSDIRZPLUG/go.zsh"
source "$DOTSDIRZPLUG/hcloud.zsh"
source "$DOTSDIRZPLUG/molecule.zsh"
source "$DOTSDIRZPLUG/zk.zsh"
source "$DOTSDIRZPLUG/ai.zsh"

# Deduplicate PATH
typeset -U PATH

# Completion init
autoload -Uz compinit
compinit

# Bracketed paste in vi-mode
# The paste end marker ^[[201~ decomposes in vicmd as Esc + [201~,
# where ~ toggles case on the last pasted char. Binding both markers
# in viins AND vicmd short-circuits the keymap before that happens.
bindkey -M viins '^[[200~' bracketed-paste
bindkey -M viins '^[[201~' bracketed-paste
bindkey -M vicmd '^[[200~' bracketed-paste
bindkey -M vicmd '^[[201~' bracketed-paste

