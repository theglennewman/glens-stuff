#!/bin/bash

# Copies various files to my glens-stuff git repo and runs git status.
#
# gnewman 2019.10.01

dstDir="${HOME}/github-projects/glens-stuff"

# source as first item, destination in git as second item
thefiles=()
thefiles+=("~/.bashrc")

# make sure the repo doesn't have any pending changes first
cd ${dstDir}
git status 2>&1 | grep -qs 'nothing to commit, working tree clean'
gitStatCode="$?"
if [[ "${gitStatCode}" == "1" ]]; then
  echo
  echo "Git repo has changes pending: ${dstDir}"
  echo "We refuse to continue. Commit changes first before pulling updates in."
  echo
  exit 123
fi

else "We'll totally copy stuff in now"
