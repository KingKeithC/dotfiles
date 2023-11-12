# Dotfiles
Just my dotfiles.

## Quick Setup
Run this command to quickly setup these dotfiles.

```bash
git -C $HOME clone --depth=1 \
  git@github.com:KingKeithC/dotfiles.git .dotfiles && \
  (cd $HOME/.dotfiles && ./setup.sh)
```

This will configure the defaults:
  - bash + installing oh-my-bash
  - git
  - vim
  - ssh
  - gpg

To also configure [i3 Wm](https://i3wm.org/docs/userguide.html), set the environment
variable `SETUP_i3` to anything other than an empty string before running `setup.sh`.

```bash
(cd $HOME/.dotfiles && SETUP_i3=1 ./setup.sh)
```
