# shellcheck disable=SC2034

# Disable autocd
shopt -u autocd

# Local defaults for oh-my-bash
OSH_THEME="sexy"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
#aliases=(general)
#completions=(git composer ssh)

# Default/Base Environment Variables
# these will be overwritten by whatever is in the .env file
export OSH=${HOME}/.oh-my-bash
export EDITOR="vim"
export PAGER="less"
export SOPS_PGP_FP="9A7C81C51A2CCA341F7A8480377C578F259D0321"
GPG_TTY="$(tty)"; export GPG_TTY

# General Aliases
alias tf='terraform'
alias tg='terragrunt'
which nvim &> /dev/null && alias vim='nvim'

# If dotenv is installed, try to import vars from dotent into the environment
if which dotenv &> /dev/null; then
  echo "dotenv on PATH, Loading..."
  while read -r keypair; do export "$keypair"; done < <(dotenv list) &> /dev/null
fi

# TODO: Maybe remove this? It's an external dependancy so.....
# Load SSH keys using Keychain, but only if there are none in the agent already (such as if I logged in with Agent Forwarding enabled.)
# Keychain docs: https://www.funtoo.org/Keychain
#if which keychain &> /dev/null ; then
#  if [ -n "$KEYCHAIN_KEYS" ]; then
#    echo "Loading Keychain Keys..."
#    eval `keychain --agents ssh,gpg --quiet --eval --nogui --attempts 3 $KEYCHAIN_KEYS`
#  else
#    echo "Loading Keychain Session..."
#    eval `keychain --agents ssh,gpg --quiet --eval --nogui`
#  fi
#else
#  echo "keychain is not installed."
#fi

echo "Loading completions..."
which gh        &> /dev/null && eval "$(gh completion -s bash)"
which kubectl   &> /dev/null && source < <(kubectl completion bash)
which flux      &> /dev/null && source < <(flux completion bash)
which terraform &> /dev/null && complete -C "$(which terraform)" terraform
which packer    &> /dev/null && complete -C "$(which packer)" packer

echo "Loading oh-my-bash..."
source $OSH/oh-my-bash.sh

echo "Available SSH Keys:"
ssh-add -l 2> /dev/null | awk '{print " -",$0}'

echo "Done. Welcome to $(hostname), ${USER}!"
