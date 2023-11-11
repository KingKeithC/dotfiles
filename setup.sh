#! /usr/bin/env bash

# Determine directory of where script was run - https://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTFILES="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

mkdir -p ~/.ssh ~/.gnupg

ln -vs --backup=numbered "$DOTFILES/bash_profile.sh" ~/.bash_profile
ln -vs --backup=numbered "$DOTFILES/bashrc.sh"       ~/.bashrc
ln -vs --backup=numbered "$DOTFILES/gitconfig"       ~/.gitconfig
ln -vs --backup=numbered "$DOTFILES/vimrc"           ~/.vimrc
ln -vs --backup=numbered "$DOTFILES/ssh-config"      ~/.ssh/config
ln -vs --backup=numbered "$DOTFILES/gpg.conf"        ~/.gnupg/gpg.conf
ln -vs --backup=numbered "$DOTFILES/gpg-agent.conf"  ~/.gnupg/gpg-agent.conf
