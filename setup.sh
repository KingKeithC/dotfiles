#! /usr/bin/env bash

# Determine directory of where script was run - https://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTFILES="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

LINK_CMD="ln -vs --backup=numbered"

# Default Configs
echo "=== Configuring Defaults ==="

echo "-- Installing Oh-my-bash --"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

echo "-- Linking Dotfiles --"
mkdir -p ~/.ssh ~/.gnupg ~/.config/htop
$LINK_CMD "$DOTFILES/bash_profile.sh" ~/.bash_profile
$LINK_CMD "$DOTFILES/bashrc.sh"       ~/.bashrc
$LINK_CMD "$DOTFILES/gitconfig"       ~/.gitconfig
$LINK_CMD "$DOTFILES/vimrc"           ~/.vimrc
$LINK_CMD "$DOTFILES/ssh-config"      ~/.ssh/config
$LINK_CMD "$DOTFILES/gpg.conf"        ~/.gnupg/gpg.conf
$LINK_CMD "$DOTFILES/gpg-agent.conf"  ~/.gnupg/gpg-agent.conf
$LINK_CMD "$DOTFILES/htoprc"          ~/.config/htop/htoprc


# i3 Config
if [[ -n "$SETUP_i3" ]]; then
  echo "=== Configuring i3 ==="
  mkdir -p ~/.config/i3
  sudo mv -vf /etc/i3/config /etc/i3/config-default 2> /dev/null

  $LINK_CMD "$DOTFILES/i3-config" ~/.config/i3/config
  $LINK_CMD "$DOTFILES/i3-status" ~/.config/i3status/config
fi
