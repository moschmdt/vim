-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


return require('packer').startup(function(use) 
    use('wbthomason/packer.nvim')

    -- My plugins here
    use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP

    use("hrsh7th/nvim-cmp" )
	    use("hrsh7th/cmp-buffer")
	    use("hrsh7th/cmp-nvim-lua")
	    use("hrsh7th/cmp-nvim-lsp" )
	    use("hrsh7th/cmp-nvim-lsp-signature-help")
	    use("hrsh7th/cmp-path")
	    use("L3MON4D3/LuaSnip")
	    use("saadparwaiz1/cmp_luasnip")

    use("simrat39/rust-tools.nvim")

    use("morhetz/gruvbox")

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use({'iamcco/markdown-preview.nvim', run=function() vim.fn["mkdp#util#install"]() end})

    if packer_bootstrap then
	    require("packer").sync()
    end
end)






