# Sam's dotfiles
Configs for Bash, Vim, Tmux, and Git. Makes for a wonderful development environment.

![Screenshot of dev environment](https://samholman.com/files/dev-environment.png)

## To set up:
```bash
git clone https://github.com/samholman/dotfiles.git
cd dotfiles
git submodule update --init --recursive
./setup.sh
```

Your Git user details can be added to `~/.gitconfig.extra`:
```
[user]
    name = Your Name
    email = you@yourdomain.com
```

### Additional software
You will (fairly obviously) need to install at least some of the following:

* [Vim](http://www.vim.org)
* [Tmux](http://tmux.sourceforge.net)
* [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
* [Git](http://git-scm.com)
* [Tig](https://github.com/jonas/tig)

## Basic usage
Create a tmux profile by copying and modifying one of the files in `.tmuxinator/`.
You can then start said profile by running `tmuxinator start <profile>`.

The *tmux* prefix key is set to `Ctrl+\`. After pressing this:

* % creates a new vertical split
* " creates a horizontal split
* z zooms into the current pane
* c creates a new "tab"
* <num> jumps to the numbered tab
* Ctrl+\ twice jumps between splits

*Vim* is set up with a few sane defaults for development (see `.vimrc`), and a few plugins are included:

* Fugitive for Git integration
* Ctrl+N toggles NERDtree (file browser pane)
* Ctrl+P for fuzzy filename searching
* Syntastic for syntax checking (on save)
* Ultisnips for code auto-completion (tab to activate)
* Easy align to aid in aligning multi-line assignments, etc (highlight some lines in Visual mode, press Enter, then a character to align by - such as equals or colon)

## Feedback

Suggestions and improvements welcome via [Github issues](https://github.com/samholman/dotfiles/issues) or [Twitter](https://twitter.com/samh).

