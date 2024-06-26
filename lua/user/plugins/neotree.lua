local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
    print("Error: neo-tree")
    return
end

local options = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf", "alpha" }, -- when opening files, do not use windows containing these filetypes or buftypes
    sort_case_insensitive = false,                                              -- used when sorting files and directories in the tree
    sort_function = nil,                                                        -- use a custom function for sorting files and directories in the tree
    default_component_configs = {
        container = {
            enable_character_fade = false
        },
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = "", -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            highlight_opened_files = true,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        diagnostics = {
            symbols = {
                error = "",
                info = "",
                hint = "",
                warn = "",
            },
            highlights = {
                hint = "DiagnosticSignHint",
                info = "DiagnosticSignInfo",
                warn = "DiagnosticSignWarn",
                error = "DiagnosticSignError",
            },
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "", -- this can only be used in the git_status source
                renamed   = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "★",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
            },
        },
        symlink_target = {
            enabled = true,
        },
    },
    source_selector = {
        sources = {
            winbar = true,
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "git_status", display_name = " 󰊢 Git " },
            { source = "document_symbols", display_name = " 󰧮 Doc Symbols " },
            content_layout = "center",
            highlight_tab = "NeoTreeTabInactive",
            highlight_tab_active = "NeoTreeTabActive",
            highlight_background = "NeoTreeTabInactive",
            highlight_separator = "ActiveWindow",
            highlight_separator_active = "NeoTreeTabSeparatorActive"
        },
    },
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    -- A list of functions, each representing a global custom command
    -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
    -- see `:h neo-tree-global-custom-commands`
    commands = {
        copy_selector = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local vals = {
                ["BASENAME"] = modify(filename, ":r"),
                ["EXTENSION"] = modify(filename, ":e"),
                ["FILENAME"] = filename,
                ["PATH (CWD)"] = modify(filepath, ":."),
                ["PATH (HOME)"] = modify(filepath, ":~"),
                ["PATH"] = filepath,
                ["URI"] = vim.uri_from_fname(filepath),
            }

            local options = vim.tbl_filter(
                function(val)
                    return vals[val] ~= ""
                end,
                vim.tbl_keys(vals)
            )
            if vim.tbl_isempty(options) then
                vim.notify("No values to copy", vim.log.levels.WARN)
                return
            end
            table.sort(options)
            vim.ui.select(options, {
                prompt = "Choose to copy to clipboard:",
                format_item = function(item)
                    return ("%s: %s"):format(item, vals[item])
                end,
            }, function(choice)
                local result = vals[choice]
                if result then
                    vim.notify(("Copied: `%s`"):format(result))
                    vim.fn.setreg("+", result)
                end
            end)
        end
    },
    window = {
        position = "left",
        width = 40,
        mapping_options = {
            noremap = false,
            nowait = true,
        },
        mappings = {
            -- ["<space>"]       = {
            --     "toggle_node",
            --     nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            -- },
            ["<2-LeftMouse>"] = "open",
            -- ["<cr>"] = "open",
            ["<cr>"]          = "open_with_window_picker",
            ["<esc>"]         = "revert_preview",
            ["<space>"]       = { "toggle_preview", config = { use_float = true } },
            ["l"]             = "focus_preview",
            ["h"]             = "open_split",
            ["v"]             = "open_vsplit",
            ["t"]             = "open_tabnew",
            ["w"]             = "open_with_window_picker",
            ["<Tab>"]         = "close_node",
            ["Z"]             = "close_all_nodes",
            ["a"]             = { "add", config = { show_path = "none" } }, -- "none", "relative", "absolute"
            ["A"]             = "add_directory",                            -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"]             = "delete",
            ["r"]             = "rename",
            ["y"]             = "copy_to_clipboard",
            ["Y"]             = "copy_selector",
            ["x"]             = "cut_to_clipboard",
            ["p"]             = "paste_from_clipboard",
            ["c"]             = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            ["m"]             = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["<esc>"]         = "close_window",
            ["R"]             = "refresh",
            ["?"]             = "show_help",
            ["F"]             = "clear_filter",
        }
    },
    nesting_rules = {},
    event_handlers = {
        -- {
        --     event = "neo_tree_popup_input_ready",
        --     ---@param args { bufnr: integer, winid: integer }
        --     handler = function(args)
        --         vim.cmd("stopinsert")
        --         vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        --     end,
        -- },
        {
            event = "file_opened",
            handler = function(file_path)
                --auto close
                require("neo-tree.command").execute({ action = "close" })
            end,
        }
    },
    filesystem = {
        filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                --".DS_Store",
                --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
            },
        },
        follow_current_file = {
            enabled = true,         -- This will find and focus the file in the active buffer every time
            -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        -- time the current file is changed while the tree is open.
        group_empty_dirs = false,           -- when true, empty folders will be grouped together
        -- hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        commands = {},                  -- Add a custom command or override a global one using the same function name
        -- instead of relying on nvim autocmd events.
        window = {
            mappings = {
                ["<bs>"]   = "navigate_up",
                ["<S-bs>"] = "set_root",
                ["H"]      = "toggle_hidden",
                ["/"]      = "fuzzy_finder",
                ["D"]      = "fuzzy_finder_directory",
                ["#"]      = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"]   = "fuzzy_sorter_directory",
                ["f"]      = "filter_on_submit",
                ["F"]      = "clear_filter",
                ["[g"]     = "prev_git_modified",
                ["]g"]     = "next_git_modified",
            },
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<C-n>"]  = "move_cursor_down",
                ["<up>"]   = "move_cursor_up",
                ["<C-p>"]  = "move_cursor_up",
            },
        },

    },
    buffers = {
        follow_current_file = {
            enabled = true,         -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
            }
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"]  = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            }
        }
    },
    document_symbols = {
        kinds = {
            File          = { icon = "󰈙", hl = "Tag" },
            Namespace     = { icon = "󰌗", hl = "Include" },
            Package       = { icon = "󰏖", hl = "Label" },
            Class         = { icon = "󰌗", hl = "Include" },
            Property      = { icon = "󰆧", hl = "@property" },
            Enum          = { icon = "󰒻", hl = "@number" },
            Function      = { icon = "󰊕", hl = "Function" },
            String        = { icon = "󰀬", hl = "String" },
            Number        = { icon = "󰎠", hl = "Number" },
            Array         = { icon = "󰅪", hl = "Type" },
            Object        = { icon = "󰅩", hl = "Type" },
            Key           = { icon = "󰌋", hl = "" },
            Struct        = { icon = "󰌗", hl = "Type" },
            Operator      = { icon = "󰆕", hl = "Operator" },
            TypeParameter = { icon = "󰊄", hl = "Type" },
            StaticMethod  = { icon = "󰠄", hl = 'Function' },
        },
        window = {
            mappings = {
                ["<cr>"] = "jump_to_symbol",
                ["r"]    = "rename",
                ["P"]    = { "toggle_preview", config = { use_float = true } },
                ["l"]    = "focus_preview",
                ["h"]    = "open_split",
                ["v"]    = "open_vsplit",
                -- Disable un-effective mappings
                ["a"]    = false,
                ["A"]    = false,
                ["c"]    = false,
                ["d"]    = false,
                ["m"]    = false,
                ["p"]    = false,
                ["x"]    = false,
                ["y"]    = false,
            },
        },
    },
}

neotree.setup(options)
