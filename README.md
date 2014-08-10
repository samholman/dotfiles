# Sam's dotfiles
Configs for Bash, Vim, Tmux, and Git.

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

