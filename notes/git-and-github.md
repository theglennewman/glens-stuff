# Git / GitHub Notes

List settings:
git config --global -l
  - you may get "unable to read config file" so just set a setting and try again
git config --global user.name "theglennewman"

I set my email to private, so GitHub provides an email for settings. Need to set this in my local "git config" settings. Probably not needed, but I also regenerated my ssh key with ssh-keygen to use the noreply email as the comment

$ ssh-keygen -f github-20191001 -t rsa -b 4096 -C "<github-no-reply-email>"
$ git config --global user.name "theglennewman"
$ git config --global user.email "<github-no-reply-email>"
$ git config --global -l
user.name=theglennewman
user.email=<github-no-reply-email>

## Need to re-learn the git quirks...

See the diff of staged files:
  git diff --staged

Or to see diffs of files that you haven't actually added for committing:
  git diff
Current changes to repo
git status
 - oh, right, forgot about this...
 - shows stuff that's staged (to be committed)
 - also shows stuff that's not staged (but different from the branch)
 - remember that you can make changes to a file... and see in the status that there are pending changes in the file that still need to be changed
git diff
 - show diffs for anything not yet staged
 - ignores any new files
git diff --staged
 - show diffs for any staged files

Commit Tree
git log --oneline --graph --decorate --all
 - I recall being able to customize this a whole bunch... but this is a good start

Updating the repo
git commit -m "message of commit"
 - ah, classic!
git push
 - don't forget to push it up
git pull
 - and remember to get any changes

Branch stuff
git branch
 - check which branch you're on
git branch -a
 - list all the remote and local branches
git checkout <branch-name>
 - checkout a current branch
git checkout -b <new-branch-name>
 - new branch!

Merge latest stuff into current branch
git checkout master
git merge <other-branch-name>
git push

Origin stuff
git remote -v
 - show the fetch / push URLs
 - my stuff will be simple since we're just pushing / pulling to github
 - but multiple collaborators may get listed here