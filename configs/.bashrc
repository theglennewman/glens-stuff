# ~/.bashrc

# Glen's bashrc
#
# remember bashrc vs bash_profile...
#   bashrc
#     - executed by interactive shells
#     - feel free to set aliases, PATH, other env settings here
#     - no output (which can screw up programs like rsync)
#   bash_profile
#     - executed by login shells
#     - usually sources bashrc
#     - output all you like

gg="${HOME}"
githubDir="${gg}/github-projects"
gstuffDir="${githubDir}/glens-stuff"
gnvpDir="${githubDir}/gnvp"
projDir="${gnvpDir}"

export PATH="${PATH}:${gg}/bin:${gstuffDir}/scripts"

gogit() {
  echo $projDir
  cd $projDir
  git status
}
gitadd() {
  gogit
  ssh-add ${gg}/.ssh/git
}
gitlog() {
  git log --oneline --graph --decorate --all
}
aliasMsg="Git aliases: gogit gitadd gitlog"

echo -e "env before checking agent...\n'$(env | grep 'SSH_')'"

# Set or re-use ssh agent. (Works with Cygwin!)
export SSH_AUTH_SOCK="${gg}/.ssh-auth-sock"
export AGENT_ENV="${gg}/.ssh-agent-env"
echo "eval agent env: ${AGENT_ENV}"
eval $(<${AGENT_ENV})
echo "check for ids"
agentIDs="$(ssh-add -l 2>&1)"
if [[ "$?" == "2" ]]; then
  echo "Error connecting to SSH agent."
  if [ -e ${SSH_AUTH_SOCK} ]; then
    # file already exists though
    echo "SSH_AUTH_SOCK exists - delete and recreate."
    rm ${SSH_AUTH_SOCK}
  else
    echo "Creating SSH_AUTH_SOCK - it didn't exist"
  fi
  ssh-agent -a ${SSH_AUTH_SOCK} > ${AGENT_ENV}
  eval $(<${AGENT_ENV})
else
  echo -e "SSH agent ready.\n${agentIDs}"
fi

echo -e "env AFTER checking agent...\n'$(env | grep 'SSH_')'"
