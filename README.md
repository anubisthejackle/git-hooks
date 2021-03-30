# Git Hooks
This is my collection of GIT hooks that should be used with any project that I work with. Each hook can be activated or deactived simply by removing it fromt he folder corresponding to it's action, or -- unconfirmed -- by removing it's executability.

## Installation
There are two main ways to install these hooks: Globally, and Per-Project.
### Globally
Installing these hooks globally is the simplest way to add them to all of your projects, with one glaring negative: If you have any hooks currently used on any projects, these hooks will cause your other hooks to stop running, unless you add them to the corresponding hooks folder.

If that's not an issue for you, you can do so by cloning this repository, and executing the following command:

```
git config --global core.hooksPath={directory of git-hooks folder}
```

### Per-Project
The benefit of installing these hooks on a per-project basis is your ability to limit the scope of impact of these hooks to just the projects that you want them to run in. The drawback is that you need to install these for each and every project that you want to use them with.

#### No Previous Hooks
The simplest way to install these in a project is to symlink the hooks folder with the git-hooks folder in this repository. To do that you would clone the repo, and then remove the old .git/hooks folder and run:

```
ln -s ~/location/of/git-hooks/folder hooks
```

This should create a symlink with the name `hooks` in the `.git` folder.

#### With Previous Hooks
If you already have hooks running in your repository, the last method that I would suggest is to copy the contents of this repository's git-hooks folder into your hooks directory, merging scripts as needed.
## Pre-Push Hooks
These hooks are performed whenever you run `git push` in a repository that has changes to push.

### confirm-non-feature-branch
This command runs whenever you are pushing to a branch that does not include the string `feature` in the branch name. It presents a confirmation message asking if you have confirmed locally that your code changes work correctly with the code that already exists on the branch.

## Pre-commit Hooks
These hooks are performed whenever you run `git commit` in a repository that has changes to commit.
### confirm-commit-merge-conflict
Multiple times I have committed, and have seen others commit, uncorrected merge conflicts. This script performs a diff check on your branch, and scans the diff for the string that defines a merge conflict. If one is found, a confirmation message is presented to you, asking if you intended to commit this merge conflict. If you respond no, it cancels the commit.
