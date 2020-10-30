#!/usr/bin/python
# [may need to point to python3, must be 3.6 or later]

import subprocess

# WHAT:   runs specified command (thru "sh" via subprocess)
# RETURN: subprocess.CompletedProcess -> (args, returncode, stdout, stderr)
# RAISE:  CalledProcessError if non-zero returned... unless check is False
# NOTE: input may be unsafe? command converted to string, not sanitized... so
#       don't do user input direct to this because shell=True is used. Maybe
#       later we'll use "shlex" as recommended in python's subprocess doc
#
# also... this requires python 3.6... make sure to use: #!/usr/bin/python3
def basherooski(command, check=True, stdout=None, stderr=None):
  more_gooder_command = str(command)
  return subprocess.run(more_gooder_command, shell=True, encoding="utf-8",
    check=check, stdout=stdout, stderr=stderr)
# no waiting, output is "live" (stdout and sterr go to parent handles)
def bash_live(command):
  return basherooski(command)
# wait then return completed process (stdout and stderr are in returned object)
def bash_complete(command):
  return basherooski(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
# run quiet, then return JUST the stdout (good for variables... but no stderr)
def bash_str(command):
  return bash_complete(command).stdout
