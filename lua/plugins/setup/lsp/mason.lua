local ok, mason = pcall(require, "mason")
if not ok then
    return
end

-- Tool installation is owned by mason-tool-installer.lua. Keep Mason itself
-- focused on registry, PATH, and UI setup.
mason.setup({
    PATH = "prepend",
    max_concurrent_installers = 10,
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
})
