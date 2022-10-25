# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
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

# Plugins
export ZDOTDIR=~/.config/zsh

# Download plugin manager if we don't have it
if ! [[ -e $ZDOTDIR/antidote ]]
then
    git clone https://github.com/mattmc3/antidote.git $ZDOTDIR/antidote
fi

# List of plugins found in ${ZDOTDIR:-~}/zsh_plugins.txt
source ${ZDOTDIR:-~}/antidote/antidote.zsh
antidote load

# Enable case insensitive tab-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Load powerlevel10k prompt
autoload -Uz promptinit && promptinit && prompt powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=$PATH:/Users/parispjones/.spicetify
