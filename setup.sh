#! /usr/bin/env bash

# Exit immediately on errors
set -e

# Determine directory of where script was run - https://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
CONFIG_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# Using this as the config directory
echo CONFIG_DIR=$CONFIG_DIR

echo "Updating Submodules..."
(
	cd $CONFIG_DIR
	git submodule init
	git submodule update
)

echo "Beginning dotfile setup..."

# Link local files to locations in the CONFIG_DIR
# Directories
ln -vsfT --backup=numbered $CONFIG_DIR/oh-my-bash/ ~/.oh-my-bash

# Files
ln -vs --backup=numbered $CONFIG_DIR/bash_profile ~/.bash_profile
ln -vs --backup=numbered $CONFIG_DIR/bashrc ~/.bashrc
ln -vs --backup=numbered $CONFIG_DIR/gitconfig ~/.gitconfig
ln -vs --backup=numbered $CONFIG_DIR/vimrc ~/.vimrc
ln -vs --backup=numbered $CONFIG_DIR/ssh-config ~/.ssh/config
ln -vs --backup=numbered $CONFIG_DIR/gpg.conf ~/.gnupg/gpg.conf
ln -vs --backup=numbered $CONFIG_DIR/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Remove all permissions from group and other in the config directory
chmod -v go-rwx $CONFIG_DIR/*

if [ -z "$REMOTE_CONTAINERS" ]; then
	# Ask to prune old links
	read -p "Prune old symlink backups? (y/n): " RESPONSE; if [[ "$RESPONSE" == "y" ]]; then ls -l ~/.*~*; rm -i ~/.*~*; fi
fi

echo "Setup complete :)"
