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

export PATH="${PATH}:${HOME}/bin"

alias gitset="cd ${HOME}/github-projects/glens-stuff; ssh-add ${HOME}/.ssh/git"
alias gitlog="git log --oneline --graph --decorate --all"

# to be output in bash_profile
aliasStr="(no aliases currently)"

