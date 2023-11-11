#! /usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

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
completions=(git ssh)


export OSH="$HOME/.oh-my-bash"
source "$OSH"/oh-my-bash.sh

unset SSH_AGENT_PID

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  export SSH_AUTH_SOCK
fi

GPG_TTY="$(tty)"
export GPG_TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

export EDITOR="vim"
export PAGER="less"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
