# If ZPlug ZSH manager is not installed, then install it
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Useful configs stolen from Kali defaults
setopt autocd                     # Change direectory just by typing its name
setopt notify                     # report the status of background jobs immediately
bindkey '^[[1;5C' forward-word    # ctrl + ->
bindkey '^[[1;5D' backward-word   # ctrl + <-
bindkey '^[[H' beginning-of-line  # home
bindkey '^[[F' end-of-line        # end
bindkey '^U' backward-kill-line   # ctrl + U

# Needed on Mac for brew and friends
if [[ $OSTYPE == "darwin"* ]]; then
  export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
fi

# Aliases
source ~/.aliases

# ------ ZPlug -------
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "MichaelAquilina/zsh-you-should-use", from:github

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/zsh-autosuggestions",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh

# Grab the ARM Macbook version or the x64 Linux version
# if [[ $OSTYPE == "darwin"* ]]; then
#   zplug "junegunn/fzf", \
#     from:gh-r, \
#     as:command, \
#     use:"*darwin*arm64*"

# elif [[ $OSTYPE == "linux"* ]]; then
#   zplug "junegunn/fzf", \
#     from:gh-r, \
#     as:command, \
#     rename-to:fzf, \
#     use:"*linux*amd64*"
# else
#   echo "---------------------------------------"
#   echo "Something is wrong with the fzf if statement"
#   echo "---------------------------------------"
# fi

zplug "junegunn/fzf", use:"shell/*.zsh", defer:2

zplug "romkatv/powerlevel10k", as:theme, depth:1

# Auto install new plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
