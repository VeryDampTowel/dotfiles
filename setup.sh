#!/usr/bin/zsh

# Dont run as sudo!
if [ `id -u` -eq 0 ]; then
  echo "Dont run as sudo. We want to install user-level configs"
  exit 1
fi

# Make sure this script is called from within the directory
if [ ! "$(basename "$PWD")" = "dotfiles" ] ; then echo "You gotta cd into the dir first because I said so." && echo "cd ~/dotfiles ; bash setup.sh" && exit ; fi

echo "Installing dependencies"
sudo apt install xclip vim git zsh curl python3-pip tmux -y

echo "Switching to ZSH"
sudo chsh $USER -s $(which zsh)

echo "Cloning the goods... "
echo -n "Statistically-likely usernames... "
git clone -q https://github.com/insidetrust/statistically-likely-usernames ~/tools/statistically-likely-usernames
echo -n "SecLists... "
git clone -q https://github.com/danielmiessler/SecLists ~/tools/SecLists
echo -n "Responder... "
git clone -q https://github.com/lgandx/Responder ~/tools/Responder
echo -n "ntfy... "
git clone -q https://github.com/VeryDampTowel/ntfy ~/tools/ntfy
echo ""
echo ""
echo ""

echo "Moving the config files"
mkdir -p ~/.config/ntfy
mv .aliases ~/.aliases
# Don't be scared. This just deletes the source .config file and its subfolders
# after syncing
rsync -av --remove-source-files .config/ ~/.config/ && find .config/ -depth -type d  -empty -exec rmdir "{}" \;
mv .tmux.conf ~/.tmux.conf
mv .vimrc ~/.vimrc
mv .zshrc ~/.zshrc
sudo mv starship /usr/local/bin

# Copy NetExec Configs
mkdir -p ~/.nxc
mv nxc.conf ~/.nxc/nxc.conf

# Necessary for tmux to find configs
ln -s $HOME/.zshrc ~/.config/zsh/.zshrc

echo "Installing ntfy"
cd ~/tools/ntfy ; pip3 -q install . --user ; cd -

echo "Log out and back in and you're gucci"
