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

def try_a_print():
    print("try a print")

def bomb(msg):
    err(msg)
    quit(200)

def err(msg):
    print("ERROR: " + str(msg))

CONF_FILE = "stigcmd_example.yml"
CONF = None
def conf(debug=False):
    global CONF
    if CONF is None:
        print("Loading yaml: " + CONF_FILE)
        with open(CONF_FILE, 'r') as ymlfile:
            CONF = yaml.safe_load(ymlfile)
    if debug:
        print("DEBUG... " + str(CONF))
    return CONF

def settings(): return conf()["settings"]
def answers(): return conf()["answers"]
def rules(): return conf()["rules"]

### MAIN
rules_obj = rules()
print(str(rules_obj))
for rule_name in rules():
    rule = rules()[rule_name]
    desc = rule["description"]
    print("  -> " + desc)