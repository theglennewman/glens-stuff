#!/bin/bash

# Copies various files to my local glens-stuff git repo and runs git status.
#
# gnewman 2019.10.01

# settings
gitDir="${HOME}/github-projects/glens-stuff"
configFiles=".bashrc .bash_profile .tmux.conf"
scriptFiles="glens-stuff-updater.sh dedupe-photos"

# make sure the repo doesn't have any pending changes first
cd ${gitDir}
git status 2>&1 | grep -qs 'nothing to commit, working tree clean'
gitStatCode="$?"
if [[ "${gitStatCode}" == "1" ]]; then
  echo -e "\nGit repo has changes pending: ${gitDir}"
  echo -e "\nWe refuse to continue. Commit changes first before updating.\n"
  exit 123
fi

echo -e "\n==== Updating repo: ${gitDir}\n"

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
  	echo "  ${xx}"
  	cp ${srcDir}/${xx} ${dstDir}/${xx}
  done
}

copyworker ${HOME} ${gitDir}/configs ${configFiles}
copyworker ${HOME}/bin ${gitDir}/scripts ${scriptFiles}

# finally...
cd ${gitDir}
echo -e "\n==== New status of ${gitDir}\n"
git status
