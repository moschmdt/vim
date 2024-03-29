local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
end)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.setup()

-- LSP CONFIG
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
-- end
--
--
-- -- Setup buffer-local keymaps / options for LSP buffers
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local lsp_attach = function(client, buf)
-- 	-- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
-- 	-- or a plugin like which-key.nvim
-- 	-- <lhs>        <rhs>                        <desc>
-- 	-- "K"          vim.lsp.buf.hover            "Hover Info"
-- 	-- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
-- 	-- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
-- 	-- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
-- 	-- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
-- 	-- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
-- 	-- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
-- 	-- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
-- 	-- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
-- 	-- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"
--
-- 	vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
-- 	vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- 	vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
-- end
--
-- -- Setup rust_analyzer via rust-tools.nvim
-- require("rust-tools").setup({
-- 	server = {
-- 		capabilities = capabilities,
-- 		on_attach = lsp_attach,
-- 	}
-- })
--
-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--       ["rust-analyzer"] = {}
--     }
-- }
