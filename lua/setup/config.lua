-- Config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.splitbelow = true -- put new windows below current
vim.opt.splitright = true -- put new vertical splits to right

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.completeopt = "menuone, noselect"

vim.opt.scrolloff = 8

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.filetype.add({
    extension = {
        soar = "soar",
    },
    filename = {
        ['*.soar'] = 'soar',
    },
    pattern = {
        ['*.soar'] = 'soar',
    }
})

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true


-- Set highlight on search
vim.o.hlsearch = false
