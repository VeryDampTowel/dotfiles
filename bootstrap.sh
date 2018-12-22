#!/usr/bin/env bash

cd "$dirname "${BASH_SOURCE}")";

git pull origin master;

function startUp() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
  source ~/.bash_profile;
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
  startUp;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    startUp;
  fi;
fi;


if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

unset startUp;
