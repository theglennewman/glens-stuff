# Git / GitHub Notes
I'm re-learning all the git quirks and syntax.

## Initial Config
I set my email to private so GitHub provides a noreply email. If I set this in my local git config settings it will properly link my commits with my user profile in the GitHub UI. I also regenerated my ssh key with ssh-keygen to use the noreply email as the comment (though this is probably not necessary).
```
$ ssh-keygen -f <keyfilename> -t rsa -b 4096 -C "<github-no-reply-email>"
$ git config --global user.name "theglennewman"
$ git config --global user.email "<github-no-reply-email>"
$ git config --global -l
```

## Git cheatsheet
```
Status:
  git status         => ah, yes, now I remember... this is used all the time
  git diff           => diff files that aren't staged
  git diff --staged  => diff staged files
  git log --graph --decorate --oneline --all
    => set an alias for this... try without --oneline

Updates:
  git pull
  git commit -m "message for commit"
  git push
  git push --all origin  => push all branches to origin

Branches:
  git branch     => which branch am I on?
  git branch -a  => list all remote and local branches
  git checkout <branch-name>         => switch to different branch
  git checkout -b <new-branch-name>  => create and switch to new branch
  git branch -d <branch-name>       => delete branch locally
  git push -d origin <branch-name>  => delete branch on origin

Other commands:
  git remote -v  => display the fetch / push URLs for remotes

Example: merging a branch into master:
  git checkout master
  git merge <other-branch-name>
  git push
```
## Aliases
### git log
```
format_str="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"

# bash function
gitlog() {
xtra_args="$@"
#git log --graph --pretty=format:"${format_str}" --abbrev-commit ${xtra_args}

# all branches... and without abbrev-commit
}

# git alias
git config --global alias.lg "log --color --graph --pretty=format:'${format_str}' --abbrev-commit"

# use alias (you can add args to the git log)
git lg -p
```