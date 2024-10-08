# Marcus Grant's ZSH Configuration
# Parts of this may be generated by my role-mydotfiles ansible role

# The following lines were added by compinstall
# General ZSH Settings
# ===============================
# Completions
zstyle ':completion:*' format 'Completing %d'
zstyle :compinstall filename "$DOTSDIRZ/rc.zsh"

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Before continuing because of unpredicatability of zsh config file calls...
# make sure that zshenv has been sourced and its vars have definitions
if [ -z $DOTSDIR ]; then source ~/.zshenv; fi

# Key timeouts
# I set this because vim/nvim feels sluggish in ZSH.
# ZSH apparently treats escape chars differently so needs some tweaking.
KEYTIMEOUT=1 # 1 = 10ms delay for escape chars

### PATH overrides - only some of these are needed to make some occur first
# Homebew should default to /opt/homebrew/bin first
# [[ ! $PATH == *"/opt/homebrew/bin"* ]] && export PATH="/opt/homebrew/bin:$PATH"
# This is needed early because PATH is needed in configs - especially prompt
# export PATH="/opt/homebrew/bin:$PATH"
# TODO: Path check doesnt actually find the string in PATH in any condition
# if [[ "$PATH" == "/opt/homebrew/bin" ]]; then
#     echo "homebrew path already there!!!"
# else
#     echo "homebrew path not there!!!"
#     export PATH="/opt/homebrew/bin:$PATH"
# fi

### Prompt
source "$DOTSDIRZ/prompt.zsh"

### Aliases
source "$DOTSDIRZ/aliases.zsh"

### Plugins
source $DOTSDIRZPLUG/general.zsh
source $DOTSDIRZPLUG/fzf.zsh
source $DOTSDIRZPLUG/pass.zsh
source $DOTSDIRZPLUG/go.zsh
source $DOTSDIRZPLUG/hcloud.zsh
source $DOTSDIRZPLUG/molecule.zsh
source $DOTSDIRZPLUG/zk.zsh
source $DOTSDIRZPLUG/ai.zsh


# ZSH Configs (Misc.)
# Remove duplicates in PATH
typeset -U PATH

# Compinit autogen'd
autoload -Uz compinit
compinit

