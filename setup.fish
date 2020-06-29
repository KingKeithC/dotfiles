#! /usr/bin/fish

# Set the Config Directory to the directory of thie script.
set CONFIG_DIR (dirname (readlink -m (status --current-filename)))

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

