function rm_dotfile_backups
  rm -i ~/.~
end

if status --is-interactive
  keychain --eval --quiet -Q ~/.ssh/keithking ~/.ssh/ansibleagent | source
end

