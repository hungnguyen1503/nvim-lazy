local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
    -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    ignore_buf_on_tab_change = {},
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    on_attach = "disable",  -- function(bufnr). If nil, will use the deprecated mapping strategy
    remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs)
    view = {
        adaptive_size = true,
        centralize_selection = false,
        -- width = 50,
        -- height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        -- @deprecated
        mappings = {
            custom_only = true,
            list = {
                -- user mappings go here
                { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
                { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
                { key = "<S-k>",                          action = "toggle_file_info" },
                { key = "<C-v>",                          action = "vsplit" },
                { key = "<C-x>",                          action = "split" },
                { key = "<C-t>",                          action = "tabnew" },
                { key = "<",                              action = "prev_sibling" },
                { key = ">",                              action = "next_sibling" },
                { key = "P",                              action = "parent_node" },
                { key = "<BS>",                           action = "close_node" },
                { key = "<Tab>",                          action = "preview" },
                { key = "R",                              action = "refresh" },
                { key = "a",                              action = "create" },
                { key = "d",                              action = "remove" },
                { key = "D",                              action = "trash" },
                { key = "r",                              action = "rename" },
                { key = "<C-r>",                          action = "full_rename" },
                { key = "x",                              action = "cut" },
                { key = "c",                              action = "copy" },
                { key = "p",                              action = "paste" },
                { key = "y",                              action = "copy_name" },
                { key = "Y",                              action = "copy_path" },
                { key = "gy",                             action = "copy_absolute_path" },
                { key = "f",                              action = "live_filter" },
                { key = "F",                              action = "clear_live_filter" },
                { key = "q",                              action = "close" },
                { key = "U",                              action = "first_sibling" },
                { key = "D",                              action = "last_sibling" },
            },
        },
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 50,
                height = 40,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "╰",
                edge = "│",
                item = "├─",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "",
                },
            },
        },
        special_files = { "Makefile", "README.md", "readme.md", "CMakeLists.txt", ".clang-format" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = { ".gitignore", ".ci" },
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 700,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
} -- END_DEFAULT_OPTS
