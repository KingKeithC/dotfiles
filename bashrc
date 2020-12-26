export GPG_TTY="$(tty)"

[[ "$TERM_PROGRAM"=="vscode" ]] && exec bash -l

