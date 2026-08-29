local groups = {
    "plugins.colorscheme",
    "plugins.explorer",
    "plugins.git",
    "plugins.editor",
    "plugins.lsp",
    "plugins.treesitter",
    "plugins.ui",
}

local plugins = {}
for _, group in ipairs(groups) do
    vim.list_extend(plugins, require(group))
end

return plugins
