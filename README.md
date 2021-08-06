# VIM Configureation file 

This repo just safes the neovim init.vim file for version control and backup.

Move towards the directory .config and run the following bash command:

```bash
git clone git@github.com:moschmdt/vim.git nvim
```

and install the _vim-Plug_ manager via

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
