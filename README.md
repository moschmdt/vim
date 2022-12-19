# Neovim Config Repository

This repo just safes the neovim init.lua file for version control and backup.

Move towards the directory ~/.config/ and run the following bash command:

```bash
cd ~/.config/
git clone git@github.com:moschmdt/vim.git nvim
npm i -g pyright
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Install Up-To-Date Neovim 


```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install python-dev python-pip python3-dev python3-pip neovim -y
```

Replace all editor commands with Neovim: 

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
``` 

## Docker setup

__TODO__
