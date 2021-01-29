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
