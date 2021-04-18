# ZSH Dotfiles

## Overview

A repository for my ZSH configurations.

I'm considering moving all of my dotfiles into one repository so this repository will likely be merged with my bash, vim, nvim, tmux, alacritty and tmux dotfiles spread out here in their respectively `dots-*` repository.

## Aliases

### General Aliases

| Alias | Command | Description |
--- | --- | --- |
| l | ls -a | A compact directory view, `-a` **all** types of file/dir references |
| la | ls -AF | Compact directory view, `-A` for **all except implied . ..** and `-F` to **append filetype indicator**. No symbol = file, `/` for dirs, `@` for symlinks, etc. |
| l1 | ls -1 | Shows exactly what `ls` shows, but **1** per line as a list without extra info |
| ll | ls -ahl | Shows **all** (`a`) in **human-readable** form (`h`) as a **list** (`l`) |
| lt | ll -t | Same as `ll` but sorted by time, newest first |
| ltr | lt -r | Same as `lt` but reverse order, oldest first |
| lz | ll -S | Same as `ll` but sorted by si`z`e, largest first |
| lzr | lz -r | Same as `lz` but reverse order, smallest first |
| catt | ls or cat | Either views item with `ls` if directory, or `cat` if file |
| .. | cd .. | Shorthand for `cd ..` in a shorter form |
| ... | ..; .. | Same as `..` but goes up two levels of parent directories |
| .... | ...; .. | Same as `...` but goes up three levels of parent directories |
<!-- | md | mkdir -p | A quick way to type out a tree of directories to add in one cmd |
| rd | rmdir | A quick way to delete directories | -->
<!-- | _ | sudo | A **really** short way to type `sudo` |
| q | exit | Shorthand for exiting the current shell |
| h | history | Shorthand for `history` command | -->
| edit | $EDITOR | Edits with the default editor defined in `EDITOR` environment variable|
| ezrc | edit ~/.zshrc | Edit the zsh config with default `EDITOR` |
| ezpf | $edit ~/.zprofile | Edit the zsh profile with default `EDITOR` |
| ezal | $edit (ZAliases) | Edit the zsh general aliases with default `EDITOR` |
| rzrc | source ~/.zshrc; | Reload zsh configs, useful for editing configurations |
| sedit | sudo $EDITOR | Use default `EDITOR` with sudo priveleges |
| svim | sudo vim | Use vim with sudo |
| snvim | sudo nvim | Use nvim with sudo |
| snano | sudo nano | Use nano with sudo |
| semacs | sudo emacs | Use emacs with sudo |
<!-- | grep | grep --color=auto | Default to automatic grep coloring, gets checked against host ability for color |
| grepc | grep --color=always | Force grep to use colors, programs need to know it's colored  so it's its own alias |
| grepl | grep $@ \| less | Uses a condition to check for color and pipes grep to less | -->
<!-- | py | python3 or python | Shorthand for python3 if it exists otherwise python |
| ipy | ipython3 or python | Same as `py` but referencing ipython3 or ipython |
| pip | pip3 | Overrides `pip3` if it exists, otherwise it does nothing |
| rb | ruby | Shorthand for ruby | -->
<!-- | xt | extract | Shorthand for the `extract` decompression helper script |
| ar | archive | Shorthand for the `archive` compression helper script | -->
| tm | tmux attach -t main | Start tmux with default session `main` |
| tma | tmux attach -t | Tmux attach to a given session name |
| tmn | tmux new -s | Tmux create new session with given name |
| tml | tmux new list-sessions | Tmux lists sessions |
| tmk | tmux new kill-session | Tmux kill session of given name |

## Gopass Plugin

The gopass plugin mostly just gives a function `gopass-update-zsh-completions` to update the completions in `./completions/_gopass` that are tracked by this repo each time it updates, so it should ready to be used after cloning and linking this repo. Just use `gopass-update-zsh-completions` when gopass updates something you need and push the changes on the repo.

There's also some aliases. If `gopass` is found locally, then it will override `pass`, the GNU version of this password that `gopass` is a fully compatible superset of. Then there's also some shorthand aliases below to make interacting with it quicker.

| Alias | Command   | Description                                              |
| ----- | --------- | -------------------------------------------------------- |
| passn | pass new  | Create a new password entry                              |
| passh | pass show | Show a password entry, will search with given string     |
| passc | pass -c   | Copy a password into clipboard, will search with string  |
| passl | pass list | List stored password entries as directory tree           |
| passc | pass edit | Edit a password entry using default editor               |




