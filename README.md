# My dotfiles
How to grab this repo:
WARNING: WILL PROBABLY OVERWRITE YOUR CONFIGS
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/parispjones/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' --exclude '.gitignore' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

source ~/.zshrc
config config --local status.showUntrackedFiles no
```

Use aliased `config` command to interact with the git repo locally

## Tips, Tricks, & Shortcuts
### Tmux
```
ts -> Create new session (specify name)
taa -> Attach to session
ta -> Attach to session (specify name)
tl -> List running sessions
```
### fzf
'Talk about useful fzf shortcuts and tips'
https://github.com/junegunn/fzf

### ViM
'Talk about ZSH prompt using Vi mode and share some tricks'


## Tools to consider adding
- [ ] https://github.com/Peltoche/lsd
- [ ] https://github.com/sharkdp/bat
- [ ] https://github.com/cheat/cheat
- [ ] https://github.com/ibraheemdev/modern-unix

## Great dotfiles references
- https://github.com/georgijd/dotfiles
- https://github.com/anandpiyer/.dotfiles/tree/master/.dotfiles
- https://www.atlassian.com/git/tutorials/dotfiles
