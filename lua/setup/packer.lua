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
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-path' },     -- Required
            { 'hrsh7th/cmp-buffer' },   -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP

    use("simrat39/rust-tools.nvim")
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
        "paopaol/cmp-doxygen",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects"
        }
    }

    use("rafamadriz/friendly-snippets")
    use("lervag/vimtex")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
