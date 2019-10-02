This is a nice way to launch tmux inside a cygwin bash session. If you've already got your tmux running, this will attach to that running session, so no panes or windows lost. If it's not running, it sets up a brand new tmux session.

cygwin shortcut:

C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico /cygdrive/c/Users/tool/cygwin-start.sh

cygwin-start.sh:

~~~~
#!/bin/bash

# Put this in your shortcut for cygwin.
# If it finds tmux running, attaches to a session. If not, creates a new one.

/bin/tmux a || /bin/tmux
~~~~
