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

# Define a function to link a file into home from the config directory
link-in-home() {
	LINK=$HOME/.$1
	DEST=$CONFIG_DIR/$1

	if [ -d $LINK ]; then
		mv $LINK $LINK~
	fi
	
	echo "Symlinking $LINK -> $DEST."
	ln -fs -b $DEST $LINK
}


echo "Begin dotfile setup..."

link-in-home bashrc
link-in-home oh-my-bash
link-in-home gitconfig
link-in-home vimrc

