# ~/.bashrc

# Glen's bashrc

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

alias gogit="cd ${gstuffDir}"
alias gitset="gogit; ssh-add ${gg}/.ssh/git"
alias gitlog="git log --oneline --graph --decorate --all"

# Handy list for bash_profile to remind me of available aliases. Escaped
# characters are allowed.
aliasStr="Git aliases: gogit gitset gitlog"

# Set or re-use ssh agent. (Works with Cygwin!)
export SSH_AUTH_SOCK="${gg}/.ssh-auth-sock"
ssh-add -l > /dev/null 2>&1
addCheckCd="$?"
if [[ "${addCheckCd}" == "2" ]]; then
  if [ -e ${SSH_AUTH_SOCK} ]; then
    echo "Bad SSH Agent. Deleting socket file, then re-creating the agent..."
    rm ${SSH_AUTH_SOCK}
  else
    echo "No SSH Agent. Creating one now..."
  fi
  eval $(ssh-agent -a ${SSH_AUTH_SOCK})
fi

