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
echo $CONFIG_DIR

echo "Beginning dotfile setup..."

# Link local files to locations in the CONFIG_DIR
# Directories
ln -ivs --backup=numbered $CONFIG_DIR/oh-my-bash/ ~/.oh-my-bash/

# Files
ln -ivs --backup=numbered $CONFIG_DIR/bashrc ~/.bashrc
ln -ivs --backup=numbered $CONFIG_DIR/gitconfig ~/.gitconfig
ln -ivs --backup=numbered $CONFIG_DIR/vimrc ~/.vimrc

echo "Setup complete :)"

