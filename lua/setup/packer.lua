-- auto install packer if not installed

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
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-sleuth' }


    -- This order is important!
    use { 'williamboman/mason.nvim', run = ":MasonUpdate" }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' }

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }

    use("simrat39/rust-tools.nvim")
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({ "ellisonleao/gruvbox.nvim" })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate' }

    use("rafamadriz/friendly-snippets")
    use("lervag/vimtex")

    if packer_bootstrap then
        require("packer").sync()
    end
end)

