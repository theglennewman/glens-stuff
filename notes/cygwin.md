# Cygwin
I like Windows. But I do like Linux better. So I really like Cygwin.

## Packages
In the **view** dropdown...
* select **picked** for installed packages.
* select **pending** for packages you chose in this session (or packages with updates)
* remember to clear the search bar when swapping between views

Essential Packages:
```
vim - vim-minimal comes with cygwin Base, vim is better
bind-utils - gets you dig
git
rsync
tmux
```

Other packages:
```
ping - don't remember why... maybe ping wasn't installed one time? or I wanted to avoid the windows exe?
fdupes (for finding duplicate files)
```

## Auto launch tmux
Auto attach to a tmux session, or create one, as soon as cygwin is started.

Modify the cygwin launcher (in windows, pinned to taskbar) and change the Target:
```
C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico /cygdrive/c/Users/tool/cygwin-start.sh
```

And then in cygwin-start.sh:
```
#!/bin/bash

# Put this in your shortcut for cygwin.
# If it finds tmux running, attaches to a session. If not, creates a new one.

/bin/tmux a || /bin/tmux
```
