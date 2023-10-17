local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

local on_attach = require("user.plugins.lspconfig").on_attach
local capabilities = require("user.plugins.lspconfig").capabilities

local function lspSymbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

capabilities.offsetEncoding = { "utf-8" }

vim.diagnostic.config {
    virtual_text = {
        enabled = false,
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    focusable = false,
    relative = "cursor",
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = false,
    }
)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level)
    if msg:match "exit code" then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end

local servers = {
    "pylsp",
    "clangd",
    "cmake",
    "jsonls",
    "yamlls",
    "bashls",
    "vimls",
    "lua_ls",
}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 100,
}


for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false,
            }),
        },
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    -- globals = { "vim" },
                    virtual_text = false,
                },
            },
            pylsp = {
                plugins = {
                    black = { enabled = true },
                    pyflakes = { enabled = false },
                    pylint = { enabled = false },
                    pycodestyle = { enabled = false },
                },
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'openFilesOnly',
                },
            }
        },
    })
end
