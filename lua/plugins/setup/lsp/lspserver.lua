local lsp = require("plugins.setup.lsp.lspconfig")

local servers = {
    "bashls",
    "clangd",
    "cmake",
    "jsonls",
    "lua_ls",
    "pylsp",
    "vimls",
    "yamlls",
}

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        -- Neovim >=0.11 defaults these to bare 'E'/'W'/'I'/'H' letters; reuse the
        -- diagnostic glyphs already defined in the neo-tree config.
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
})

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        flags = { debounce_text_changes = 150 },
    })
end

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        "--completion-style=detailed",
    },
})

vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                pycodestyle = { enabled = false },
            },
        },
    },
})

vim.lsp.enable(servers)
