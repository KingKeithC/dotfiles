function start_ssh_agent
  echo -n "Checking for existing agent... "
  if test -n "$SSH_AGENT_PID"
    echo "Agent already running: SSH_AGENT_PID=$SSH_AGENT_PID."
    exit 0
  else
    echo "Starting SSH Agent."
    eval (ssh-agent -c)
  end
end

