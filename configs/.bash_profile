# ~/.bash_profile

# Glen's bash_profile
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

source "${HOME}/.bashrc"

# Messages set in bashrc
echo -e "${agentMsg}"
echo
echo -e "${aliasMsg}"

