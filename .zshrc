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
zshConfigs=$HOME/.config/zsh

# if my configs don't exist then download them
# TODO add function to check for updates
# TODO this will not work if the directory exists
# and configs are not present

if [ ! -d $zshConfigs ]; then
  mkdir -p "$zshConfigs/plugins"
  mkdir -p "$zshConfigs/themes"

  git clone https://github.com/zsh-users/zsh-autosuggestions "$zshConfigs/plugins/zsh-autosuggestions"
  
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$zshConfigs/plugins/zsh-you-should-use"

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$zshConfigs/plugins/zsh-syntax-highlighting"

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$zshConfigs/themes/powerlevel10k"
fi

source "$zshConfigs/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$zshConfigs/plugins/zsh-you-should-use/you-should-use.plugin.zsh"
source "$zshConfigs/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source "$zshConfigs/themes/.p10k.zsh"
source "$zshConfigs/themes/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
