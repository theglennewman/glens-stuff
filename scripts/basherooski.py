#!/usr/bin/python
# [may need to point to python3, must be 3.6 or later]

import subprocess

# This is it! I hate cooking this up every time...
# Runs a bash command. Returns a string. (Or you can set return_code to True
# and return the command's exit code)

# Look. I just hate having to write this every dang time. And recently I found
# out they made a run function! And it's absolutely lovely. This is just a
# wrapper to that, but we always convert the command to a string and set the
# encoding to utf-8.
#
# Returns the subprocess.CompletedProcess object with these fields:
#   - args (used to launch it)
#   - returncode (exit status of the command)
#   - stdout
#   - stderr
#
# Raises the CalledProcessError if the command returned a non-zero code.
def bash_it_up(command):
  return subprocess.run(
    str(command),
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    shell=True,
    check=True,
    encoding="utf-8"
  )

bash_it_up("ls -lah") #lol I need to install python with cygwin...