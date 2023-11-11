# shellcheck disable=SC2034

echo "Welcome to $(hostname), ${USER}!"

if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi
