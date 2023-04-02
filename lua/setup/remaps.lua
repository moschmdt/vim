-- LEADER 
vim.g.mapleader = ','

vim.keymap.set('n', '<leader>dd', ':Lexplore %:p:h<CR>')
vim.keymap.set('n', '<leader>da', ':Lexplore<CR>')

-- yank direct to system clipboard. 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])




