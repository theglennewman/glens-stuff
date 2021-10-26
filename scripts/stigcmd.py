#!/usr/bin/python

import yaml

help_str = """
For helping folks fill out STIG checklists.
"""

print("""

################## Vuln ID 1234  STIG 1234  Other STUFF AAAAAA
# Description or note
> This is a finding.
----- ANSWER:
System is configured as intended.
Additionally, though, this is a system.
[root@host.fqdn]# df -h
Filesystem                      Size  Used Avail Use% Mounted on
/tmp/docs/program_files/fsname  936G  334G  603G  36% /
-----

""")

def bomb(msg):
    err(msg)
    quit(200)

def err(msg):
    print("ERROR: " + str(msg))

CONF = None
def load_yaml_file(stig_cmd_yml):
    global CONF
    if CONF is None:
        print("Loading yaml: " + stig_cmd_yml)
        with open(stig_cmd_yml, 'r') as ff:
            CONF = yaml.safe_load(ff)
    print(str(CONF))

def get_val(key):
    if CONF is None:
        bomb("Trying to fetch from yaml, but CONF is NONE")
    print("get conf: " + key)
    value = CONF[key]
    print("value is: " + str(value))

### MAIN
load_yaml_file("stigcmd_example.yml")
get_val('settings')