#! /usr/bin/fish

# Set the Config Directory to the directory of thie script.
set CONFIG_DIR (dirname (readlink -m (status --current-filename)))

# Install Distro Specific Packages
set DISTRO (cat /etc/*-release | grep -oP 'DISTRIB_ID=\K.*')

echo "Performing Setup for DISTRO=$DISTRO"

switch $DISTRO
case Ubuntu
  set PACKAGES "vim less git"
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y $PACKAGES
  
  set -x EDITOR vim
  set -x PAGER less
end

# Define a function to link a file into home from the config directory
function link
  set TARGET $CONFIG_DIR/$argv[2]
  set LINK $HOME/$argv[1]

	ln -v -s --backup=numbered $TARGET $LINK
end


echo "Begin dotfile setup..."
link .gitconfig gitconfig
link .vimrc vimrc
link .config/fish/config.fish config.fish

