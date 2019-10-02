# glens-stuff
Scripts, settings, notes, and whatever other stuff to keep around wherever I go.

## notable changes
2019.10.01 Revisited this idea, discarded the toolbox history (which had bad username / emails in the commits), and moved it to glens-stuff.  
2017.05.15 Created toolbox repo with just "cygwin-tmux-launcher" file.

# Unsorted notes...

## Note the ssh-add responses for various other states...
These need to be handled in the bashrc. I think we only check for return code 2, meaning the socket file is missing. Forgot to check if identities were deleted.

Well wait... that's not right either. The bashrc should just handle the ssh agent. User (me) will handle if I'm stupid and forgot to add the identity...

Still, could be good to check and note if the identity isn't there. And we may actually want to clean up the identity... I've noticed I can close out cygwin entirely and my identity is still good. There's probably situations where that shouldn't be the case.

Also... I bet if I reboot and come back, the agent file will still be there, so it will get picked up. This would be handled if we confirm PID is actually a PID.

Should we do these checks?
- pid in the SSH_AGENT_PID is actually a running process
- socket file doesn't exist (already gets checked in bashrc... but what about in my aliases that add the git identity?)

Remember commands:
ssh-agent -s
  - shows PID and SSH_AUTH_SOCK
ssh-add -l
  - just looking at added agents

Examples...

$ ssh-add -l
  <identity fingerprint displayed>
$ echo $?
  0

$ ssh-add -D
  All identities removed.
$ ssh-add -l
  The agent has no identities.
$ echo $?
  1

$ rm .ssh-auth-sock
$ ssh-add -l
  Error connecting to agent: No such file or directory
$ echo $?
  2


