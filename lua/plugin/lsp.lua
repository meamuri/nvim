local lsp_zero = require('lsp-zero')
local lua_opts = lsp_zero.nvim_lua_ls()

require('lspconfig').lua_ls.setup(lua_opts)
-- Make sure that `opam install ocaml-lsp-server` is executed
require('lspconfig').ocamllsp.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'clangd',
        'clojure_lsp',
        'cssls',
        'eslint',
        'java_language_server',
        'jsonls',
        'lua_ls',
        'sqlls',
        'zls',
        'rust_analyzer',
        'gopls',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp_action.toggle_completion(),
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    })
})


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "ff", function() vim.lsp.buf.format({ async = false }) end)
end)
