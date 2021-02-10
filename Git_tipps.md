# Tipps for Git


## git summary of multiple repos:

https://github.com/MirkoLedda/git-summary

## git tools 

Install `gitk` and `git-gui`.

### git-gui: add tools

commands to add (add them globally for other projects):
* `revert` = `git checkout $FILENAME`
* `diff_meld` = `meld $FILENAME`
* `delete` = `rm $FILENAME`
* `remove` = `git rm $FILENAME`
* `unversion` = `git rm --cached $FILENAME`
* `edit` = `gedit $FILENAME`
* `atom` = `atom $FILENAME`, very useful to resolve  merge conflicts

Now just select a file, then Tools->"cmd".

## git compare two different branches in meld


Install `meld` and define it a default diff tool for git
```
git config --global diff.tool meld
```

Lets say you want to see the progress between two branches `old_branch` and `new_branch` type
```
git difftool --dir-diff old_branch new_branch 

```

## git view all changes made on a file

```
gitk <path to file>
```
