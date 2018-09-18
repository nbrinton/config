# Git Repository Configuration File
To be able to use the aliases in this file, navigate to the .git/ directory in your repository and
copy the contents of the file `config` from this repo to the `config` file in that directory.

The current aliases are these:
| Alias | Actual Command | Function |
| --- | --- | --- |
| `ll` | `log --graph --all --oneline` | Prints a nice readable representation of the repository including the commits, branches, the HEAD pointer, and tags. |
| `s` | `status` | Shorthand for `git status` which prints the status of the current local repo branch.|
| `ch` | `checkout` | Shorthand for `git checkout` which is used to switch branches or undo changes to a tracked file.
