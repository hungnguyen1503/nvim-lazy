local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local options = {
    ensure_installed = {
        -- C/C++ language
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "codelldb",
        "cpplint",
        "cpptools",

        "lua-language-server",

        -- Bash language
        "bash-debug-adapter",
        "bash-language-server",

        -- Python language
        "debugpy",
        "python-lsp-server",
        "pyflakes",
        "reorder-python-imports",
        -- "diagnostic-languageserver",

        -- Json language
        "fixjson",
        "json-lsp",

        -- Lua language
        "lua-language-server",
        "stylua",

        -- Markdown
        "markdownlint",

        -- Vim language
        "vim-language-server",

        -- Yaml language
        "yaml-language-server",
        "yamlfmt",
        "yamllint",

        -- Other
        "prettier",
        "xmlformatter",
    }, -- not an option from mason.nvim
    PATH = "prepend", -- "skip" seems to cause the spawning error
    ui = {
        icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
        },

        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    },

    max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason.setup(options)
