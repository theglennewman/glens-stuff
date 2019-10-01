#!/bin/bash

# Copies various files to my local glens-stuff git repo and runs git status.
#
# gnewman 2019.10.01

gitDir="${HOME}/github-projects/glens-stuff"
configFiles=".bashrc .bash_profile .tmux.conf"

# make sure the repo doesn't have any pending changes first
cd ${dstDir}
git status 2>&1 | grep -qs 'nothing to commit, working tree clean'
#gitStatCode="$?"
gitStatCode="0" # for now, while making changes, ignore the git status
if [[ "${gitStatCode}" == "1" ]]; then
  echo
  echo "Git repo has changes pending: ${gitDir}"
  echo "We refuse to continue. Commit changes first before pulling updates in."
  echo
  exit 123
fi

# arg 1 = source dir
# arg 2 = dest dir
# arg 3+ = files to copy
copyworker () {
  srcDir="$1"
  dstDir="$2"
  shift 2
  files="$@"
  echo "${srcDir} => ${dstDir}"
  for xx in ${files}; do
  	src="${srcDir}/${xx}"
  	dst="${dstDir}/${xx}"
  	echo "  ${src} => ${dst}"
  	cp ${src} ${dst}
  done
}

copyworker ${HOME} ${gitDir}/configs ${configFiles}

# finally...
cd ${gitDir}
echo
git status
