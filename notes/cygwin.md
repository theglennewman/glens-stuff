# Cygwin
I like Windows. But I do like Linux better. So I really like Cygwin.

## Packages
In the **view** dropdown...
* select **picked** for installed packages.
* select **pending** for packages you chose in this session (or packages with updates)
* remember to clear the search bar when swapping between views

```
bind-utils (includes dig)
curl
fupes (for finding duplicate files)
git
p7zip
ping (don't remember, maybe I didn't like the windows ping?)
rsync
tmux
vim (cygwin base install only has vim-minimal)
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

## Modifying HOME
NOTE: Cygwin recommends using nss instead of /etc/passwd

- if /etc/passwd doesn't exist...
- `mkpasswd` generates output for all users
- `mkpasswd -c` for just current user
- redirect to /etc/passwd, then modify the home dir field