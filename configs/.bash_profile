# ~/.bash_profile

# Glen's bash_profile

# remember bashrc vs bash_profile...
#   bashrc
#     - executed by interactive shells
#     - feel free to set aliases, PATH, other env settings here
#     - no output (which can screw up programs like rsync)
#   bash_profile
#     - executed by login shells
#     - usually sources bashrc
#     - output all you like

# environment
source "${HOME}/.bashrc"
eval $(ssh-agent -s) > /dev/null

# aliasStr gets set in my bashrc
echo -e "\n  ${aliasStr}"

