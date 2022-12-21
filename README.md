# Neovim Config Repository

## Prerequisites

### Install node and upgrade node

```bash
sudo apt-get install -y curl git && \
     sudo apt install -y nodejs npm && \
     sudo npm install -g n && \
     sudo n lts
```

If using Docker, just replace sudo with RUN.

### Install neovim

```bash
sudo apt-get -y install software-properties-common && \
              sudo add-apt-repository ppa:neovim-ppa/stable && \
              sudo apt-get update && \
              sudo apt-get install python3-dev python3-pip neovim -y
```

If using Docker, just replace sudo with RUN.

### Configuration

#### Ubuntu system

Change working directory to .config and clone this repository:

```bash
cd ~/.config/ && \
git clone git@github.com:moschmdt/vim.git nvim
```

#### In docker container

Add this at the end of your Dockerfile. You may have to replace the ${USER}
with the name of the user you are creating in the docker image.

```
WORKDIR /home/${USER}/

RUN mkdir /home/${USER}/.config
WORKDIR /home/${USER}/.config

RUN git clone https://github.com/moschmdt/vim.git nvim
```

### Usage

When starting nvim for the first time, you will get an error like:

```
Error detected while processing /home/andi/.config/nvim/init.lua:
E5113: Error while calling lua chunk: /home/andi/.config/nvim/lua/setup/plugin/lsp-config.lua:38: module 'cmp_nvim_lsp' not found:
	no field package.preload['cmp_nvim_lsp']
	no file './cmp_nvim_lsp.lua'
	no file '/usr/share/luajit-2.1.0-beta3/cmp_nvim_lsp.lua'
	no file '/usr/local/share/lua/5.1/cmp_nvim_lsp.lua'
	no file '/usr/local/share/lua/5.1/cmp_nvim_lsp/init.lua'
	no file '/usr/share/lua/5.1/cmp_nvim_lsp.lua'
	no file '/usr/share/lua/5.1/cmp_nvim_lsp/init.lua'
	no file './cmp_nvim_lsp.so'
	no file '/usr/local/lib/lua/5.1/cmp_nvim_lsp.so'
	no file '/usr/lib/x86_64-linux-gnu/lua/5.1/cmp_nvim_lsp.so'
	no file '/usr/local/lib/lua/5.1/loadall.so'
stack traceback:
	[C]: in function 'require'
	/home/andi/.config/nvim/lua/setup/plugin/lsp-config.lua:38: in main chunk
	[C]: in function 'require'
	/home/andi/.config/nvim/init.lua:5: in main chunk
```

Just use enter on your keyboard and Packer should install automatically all of the dependencies.
If not, you can also open NVIM and install them manually with :PackerUpdate

If you want to use the python language server, execute the following command:

```bash
sudo npm i -g pyright
```
