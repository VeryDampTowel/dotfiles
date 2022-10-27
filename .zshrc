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
  export PATH=$PATH:$HOME/.spicetify
fi

# Install starship prompt
if ! command -v starship >/dev/null 2>&1; then
  if which wget >/dev/null ; then
    echo "Downloading via wget"
    wget https://starship.rs/install.sh
  elif which curl >/dev/null ; then
    echo "Downloading via curl"
    curl -sS -O https://starship.rs/install.sh
  else
    echo "Cannot download, neither wget nor curl. Exiting"
    exit 1
  fi
  sh ./install.sh
  rm ./install.sh
fi

# Aliases
source ~/.aliases

# Define config folder
export ZDOTDIR=~/.config/zsh

# Download plugin manager if we don't have it
if ! [[ -e $ZDOTDIR/antidote ]]
then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/antidote
fi

# Make plugin folder names pretty
zstyle ':antidote:bundle' use-friendly-names 'yes'

# Source and load plugins found in ${ZDOTDIR}/.zsh_plugins.txt
source ${ZDOTDIR:-~}/antidote/antidote.zsh

# Load the plugins
antidote load

# Install fzf binary if not found
if ! [[ -e "$(antidote home)/junegunn/fzf/bin/fzf" ]]
then
  "$(antidote home)/junegunn/fzf/install" --bin
fi

# Enable case insensitive tab-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit


# Restore FZF Key bindings
zvm_after_init() {
  source "$(antidote home)/junegunn/fzf/shell/completion.zsh"
  source "$(antidote home)/junegunn/fzf/shell/key-bindings.zsh"
}

# Load starship prompt
eval "$(starship init zsh)"
