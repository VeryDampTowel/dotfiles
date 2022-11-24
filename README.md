# My dotfiles
The following will place the git repo in `$HOME/.dotfiles`, create `$HOME/.config-backup` and move any clashing files to avoid overwriting, then copy my dotfiles to `$HOME`.

```shell
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/parispjones/dotfiles $HOME/.dotfiles
mkdir -p $HOME/.config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config sparse-checkout set '/*' '!README.md'
config config --local status.showUntrackedFiles no

source ~/.zshrc

# Necessary for tmux to find configs
ln -s $HOME/.zshrc $ZDOTDIR/.zshrc
```


Hint: Use alias `config` command to interact with the git repo locally

## Tips, Tricks, & Shortcuts
### Tmux
```
ts -> Create new session (specify name)
taa -> Attach to recent session
ta -> Attach to session (specify name)
tl -> List running sessions
```

### [fzf](https://github.com/jeffreytse/zsh-vi-mode)
Recommend reading the documentation as there's a lot of fun here, but here are some frequently used options

`CTRL + R` -> Fuzzy search command history

`CTRL + T` -> Fuzzy search files/directories

`fzf --preview 'cat {}'` will open a separate window to show the contents of files as you search them in real time

`vim **<TAB>` will fuzzy search files then open in vim

### [ZSH-VI-Mode](https://github.com/jeffreytse/zsh-vi-mode)

Nearly all vim commands and tricks are available
By default, ESC will switch to Normal mode, but this can be changed in `$(antidote home)/jeffreytse/zsh-vi-mode/zsh-vi-mode.zsh`

[TPope's Surround plugin](https://github.com/tpope/vim-surround) is also included, for example :

```
ds"  -> Delete " around text object
cs"' -> Change " to '
ys"  -> Add " to visual selection (v to enter visual mode, then select text object)
vi"  -> Select text object inside "
va"  -> Select text object including "
```

If you prefer to use a standard vim session to edit commands, `vv` in Normal mode can help.

#### Tools to consider adding
- [ ] https://github.com/Peltoche/lsd
- [ ] https://github.com/sharkdp/bat
- [ ] https://github.com/cheat/cheat
- [ ] https://github.com/ibraheemdev/modern-unix

#### Great dotfiles references
- https://github.com/georgijd/dotfiles
- https://github.com/anandpiyer/.dotfiles/tree/master/.dotfiles
- https://www.atlassian.com/git/tutorials/dotfiles
