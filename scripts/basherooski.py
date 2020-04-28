#!/usr/bin/python
# [may need to point to python3, must be 3.6 or later]

import subprocess

# Returns the subprocess.CompletedProcess object with these fields:
#   - args (used to launch it)
#   - returncode (exit status of the command)
#   - stdout
#   - stderr
# Raises the CalledProcessError if the command returned a non-zero code.
def bash_it_up(command):
  # there may be a better way to process / sanitize the command input... maybe
  # something in shlex as recommended in the subprocess doc? I'm calling with
  # shell = True but maybe I shouldn't
  more_gooder_command = str(command)
  return subprocess.run(
    more_gooder_command,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    shell=True,
    check=True,
    encoding="utf-8"
  )

bash_it_up("ls -lah") #lol I need to install python with cygwin...