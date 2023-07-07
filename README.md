# Git Hooks
This is my collection of GIT hooks that should be used with any project that I work with. Each hook can be activated or deactived simply by removing it from the folder corresponding to it's action, or by removing it's executability.

## Installation
Installing these git hooks is very simple. First, you clone the repository into any folder that you would like,
and then run this command:

```
git config --global core.hooksPath {directory of git-hooks folder}
```

This modifies your hooks path globally, which directs all hooks to run through the git hooks folder. This will then execute the hooks here, which have been activated, and then execute the local project `.git/hooks/` script that corresponds to the hook you are executing.

## Pre-Push Hooks
These hooks are performed whenever you run `git push` in a repository that has changes to push.

### confirm-non-feature-branch
This command runs whenever you are pushing to a branch that does not include the string `feature` in the branch name. It presents a confirmation message asking if you have confirmed locally that your code changes work correctly with the code that already exists on the branch.

## Pre-commit Hooks
These hooks are performed whenever you run `git commit` in a repository that has changes to commit.
### confirm-commit-merge-conflict
Multiple times I have committed, and have seen others commit, uncorrected merge conflicts. This script performs a diff check on your branch, and scans the diff for the string that defines a merge conflict. If one is found, a confirmation message is presented to you, asking if you intended to commit this merge conflict. If you respond no, it cancels the commit.
