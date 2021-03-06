# Sam's dotfiles
Configs for Bash, Zsh, Vim, Tmux, and Git. Makes for an awesome, programmable development environment.

![Screenshot of dev environment](https://samholman.com/files/tmux-vim.jpg)

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
* [Ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher)
* [Exuberant Ctags](http://ctags.sourceforge.net)
* [ESLint](http://eslint.org/docs/user-guide/getting-started)
* [ESLint React Plugin](https://www.npmjs.com/package/eslint-plugin-react)
* [Babel ESLint](https://github.com/babel/babel-eslint)
* [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer)
* [PHP CS Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)

## Basic usage
Create a tmux profile by copying and modifying one of the files in `.tmuxinator/`.
You can then start said profile by running `tmuxinator start <profile>`.

The *tmux* prefix key is set to `Ctrl+\`. After pressing this:

* % creates a new vertical split
* " creates a horizontal split
* z zooms into the current pane (making it full screen)
* c creates a new "tab"
* \<num\> jumps to the numbered tab
* Ctrl+\ twice jumps between splits

*Vim* is set up with a few sane defaults for development (see `.vimrc`), and a few plugins are included:

* [Fugitive](https://github.com/tpope/vim-fugitive) for Git integration
* Ctrl+N toggles [NERDtree](https://github.com/scrooloose/nerdtree) (file browser pane)
* Ctrl+C toggles [Tagbar](https://github.com/majutsushi/tagbar) (uses Ctags)
* [Ctrl+P](https://github.com/kien/ctrlp.vim) for fuzzy filename searching
* [Syntastic](https://github.com/scrooloose/syntastic) for syntax checking (on save)
* [Ultisnips](https://github.com/SirVer/ultisnips) for code auto-completion (tab to activate)
* [Easy align](https://github.com/junegunn/vim-easy-align) to aid in aligning multi-line assignments, etc (highlight some lines in Visual mode, press Enter, then a character to align by - such as equals or colon)

## Extra Vim shortcuts

* The key combo `\t` runs the current PHP or JS test file through an appropriate test runner (PHPUnit/Mocha), in a separate Tmux pane.
* `\s` runs a recursive search (using `ag`) for the word under your cursor and lists results in the quickfix panel.
* `\cs` will fix PHP codesniffer problems.
* `\\` jumps between split panes.
* `\z` toggles "zoom" on the current pane (a bit like tmux).

## Feedback

Suggestions and improvements welcome via [Github issues](https://github.com/samholman/dotfiles/issues) or [Twitter](https://twitter.com/samh).

## Troubleshooting

* **The colours look weird!**
  Make sure your term is set to use 256 colours. Usually `xterm-256color`.

* **So many words highlighted in Vim?**
  That's probably the spelling/grammar checker which is set to en-GB by default. Use `[s` and `]s` to jump between spelling errors and use `z=` to see suggestions.
  You can toggle it on and off with `:set spell!`.
