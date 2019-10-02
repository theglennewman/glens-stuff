# Cygwin
I like Windows. But I do like Linux better. So I really like Cygwin.

## Packages
Packages I like to install via the Cygwin Installer. Remember in the package selector you can switch the **View** dropdown to **Picked** to see the selected packages instead of the full list of dependencies.

These are the essential packages I like to include every time I install cygwin:
```
bind-utils
git
ping
rsync
tmux
vim (if you skip vim you get vim-minimal as part of Base)
```

Optional packages I don't necessarily need on everything:
```
fdupes (for finding duplicate files)
```

## Auto launch tmux
When I launch Cygwin I like jumping right into tmux. This will attach to a running session or create one.

In the terminal launcher (I usually have this pinned to my task bar), set this as the Target:
```
C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico /cygdrive/c/Users/tool/cygwin-start.sh
```

And then put this into cygwin-start.sh:
```
#!/bin/bash

# Put this in your shortcut for cygwin.
# If it finds tmux running, attaches to a session. If not, creates a new one.

/bin/tmux a || /bin/tmux
```
