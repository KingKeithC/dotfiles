#! /usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Disable autocd
shopt -u autocd

# Local defaults for oh-my-bash
export OSH="$HOME/.oh-my-bash"
OSH_THEME="mairan"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
#aliases=(general)
completions=(git ssh)

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="vim"
export PAGER="less"

GPG_TTY="$(tty)"
export GPG_TTY

which nvim &> /dev/null && alias vim=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pup='PATH="$(pwd)/.venv/bin:$PATH" VIRTUAL_ENV="$(pwd)/.venv" sops exec-env ../secret_env.yml bash'


# Setup SSH/GPG Agents (if not in vscode, as vscode handles this for us)
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  unset SSH_AGENT_PID

  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK
  fi

  gpg-connect-agent updatestartuptty /bye >/dev/null
fi

source "$OSH"/oh-my-bash.sh

