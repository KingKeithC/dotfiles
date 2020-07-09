function rm_dotfile_backups
  rm -i ~/.~
end

if status --is-interactive
  keychain --ignore-missing --eval --quiet -Q ~/.ssh/keithking ~/.ssh/ansibleagent ~/.ssh/AIX_Non-Prod ~/.ssh/AIX_QA ~/.ssh/AIX_PROD ~/.ssh/ASOP ~/.ssh/GROUPINFRA ~/.ssh/KeithKing-AH_GoAnywhere | source
end

