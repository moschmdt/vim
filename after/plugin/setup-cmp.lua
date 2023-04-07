local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup cmp
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    view = {
        entries = "native",
    },
    sources = cmp.config.sources({
        { name = "gh_issues" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "doxygen" },
        { name = "luasnip" },
        { name = "path" },
    }, {
        { name = "buffer", keyword_length = 3 },
    }),
    experimental = {
        ghost_text = true,
    }
})
