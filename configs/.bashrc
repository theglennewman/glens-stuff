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

export PATH="${PATH}:${gg}/bin:${gstuffDir}/scripts"

alias gogit="cd ${gstuffDir}; git status"
alias gitset="gogit; ssh-add ${gg}/.ssh/git"
alias gitlog="git log --oneline --graph --decorate --all"
aliasMsg="Git aliases: gogit gitset gitlog"

# Set or re-use ssh agent. (Works with Cygwin!)
export SSH_AUTH_SOCK="${gg}/.ssh-auth-sock"
agentIDs="$(ssh-add -l 2>&1)"
agentMsg=""
if [[ "$?" == "2" ]]; then
  if [ -e ${SSH_AUTH_SOCK} ]; then
    agentMsg="${agentMsg}SSH agent stale. Re-creating it. "
    rm ${SSH_AUTH_SOCK}
  else
    agentMsg="${agentMsg}No SSH agent. Creating one. "
  fi
  eval $(ssh-agent -a ${SSH_AUTH_SOCK})
else
  agentMsg="${agentMsg}SSH agent ready.\n${agentIDs} "
fi

