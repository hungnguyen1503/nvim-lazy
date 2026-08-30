local M = {}

function M.on_attach(_, bufnr)
    require("config.utils").load_mappings("lspconfig", { buffer = bufnr })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
    M.capabilities = blink.get_lsp_capabilities(M.capabilities)
end

return M
