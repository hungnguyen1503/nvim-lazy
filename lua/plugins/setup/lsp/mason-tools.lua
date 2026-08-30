local ok, installer = pcall(require, "mason-tool-installer")
if not ok then
    return
end

installer.setup({
    ensure_installed = {
        "bash-language-server",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "codelldb",
        "cpplint",
        "cpptools",
        "debugpy",
        "fixjson",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "pyflakes",
        "python-lsp-server",
        "reorder-python-imports",
        "stylua",
        "vim-language-server",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
        "xmlformatter",
    },
    run_on_start = false,
})
