local status_ok, noice = pcall(require, "noice")
if not status_ok then
    print("Error: noice")
    return
end

noice.setup({
    cmdline = {
        enabled = true, -- enables the noice cmdline ui
        view = "cmdline_popup", -- view for rendering the cmdline. change to `cmdline` to get a classic cmdline at the bottom
        opts = { lang = "vim" }, -- enable syntax highlighting in the cmdline
        format = {
            -- conceal: (default=true) this will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "vim" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "vim" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
            input = {}, -- used by input()
            -- lua = false, -- to disable a format, set to `false`
        },
    },
    messages = {
        -- note: if you enable messages, then the cmdline is enabled automatically.
        -- this is a current neovim limitation.
        enabled = true, -- enables the noice messages ui
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. set to `false` to disable
    },
    popupmenu = {
        enabled = true, -- enables the noice popupmenu ui
        backend = "nui", -- backend to use to show regular cmdline completions
        -- icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
    },
    -- you can add any custom commands below that will be available with `:noice command`
    commands = {
        history = {
            -- options for the message history that you get with `:noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {
                any = {
                    { event = "notify" },
                    { error = true },
                    { warning = true },
                    { event = "msg_show", kind = { "" } },
                    { event = "lsp", kind = "message" },
                },
            },
        },
        -- :noice last
        last = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = {
                any = {
                    { event = "notify" },
                    { error = true },
                    { warning = true },
                    { event = "msg_show", kind = { "" } },
                    { event = "lsp", kind = "message" },
                },
            },
            filter_opts = { count = 1 },
        },
        -- :noice errors
        errors = {
            -- options for the message history that you get with `:noice`
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = { error = true },
            filter_opts = { reverse = true },
        },
    },
    notify = {
        -- noice can be used as `vim.notify` so you can route any notification like other messages
        -- notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- the default routes will forward notifications to nvim-notify
        -- benefit of using noice for this is the routing and consistent history view
        enabled = true,
        view = "notify",
    },
    lsp = {
        progress = {
            enabled = false,
            -- lsp progress is formatted using the builtins for lsp_progress. see config.format.builtin
            -- see the section on formatting for more details on how to customize.
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 500, -- frequency to update lsp progress message
            view = "mini",
        },
        override = {
            -- override the default lsp markdown formatter with noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            -- override the lsp markdown formatter with noice
            ["vim.lsp.util.stylize_markdown"] = false,
            -- override cmp documentation with noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = false,
        },
        hover = {
            enabled = true,
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
        },
        signature = {
            enabled = true,
            auto_open = {
                enabled = true,
                trigger = true, -- automatically show signature help when typing a trigger character from the lsp
                luasnip = true, -- will open signature help when jumping to luasnip insert nodes
                throttle = 50, -- debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
        },
        message = {
            -- messages shown by lsp servers
            enabled = true,
            view = "notify",
            opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
            view = "hover",
            opts = {
                lang = "markdown",
                replace = true,
                render = "plain",
                format = { "{message}" },
                win_options = { concealcursor = "n", conceallevel = 3 },
            },
        },
    },
    --[[ markdown = {
		hover = {
			["|(%s-)|"] = vim.cmd.help, -- vim help links
			["%[.-%]%((%s-)%)"] = require("noice.util").open, -- markdown links
		},
		highlights = {
			["|%s-|"] = "@text.reference",
			["@%s+"] = "@parameter",
			["^%s*(parameters:)"] = "@text.title",
			["^%s*(return:)"] = "@text.title",
			["^%s*(see also:)"] = "@text.title",
			["{%s-}"] = "@parameter",
		},
	}, ]]
    health = {
        checker = false, -- disable if you don't want health checks to run
    },
    smart_move = {
        -- noice tries to move out of the way of existing floating windows.
        enabled = true, -- you can disable this behaviour here
        -- add any filetypes here, that shouldn't trigger smart move.
        excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
    },
    presets = {
        -- you can enable a preset by setting it to true, or a table that will override the preset config
        -- you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    throttle = 1000 / 500, -- how frequently does noice need to checkfor ui updates? this has no effect when in blocking mode.
    --@type noiceconfigviews
    views = {
        mini = {
            zindex = 60,
            position = {
                row = "98%",
                col = "98%",
            },
            border = {
                style = 'rounded',
            },
            win_options = {
                winblend = 80,
            },
            timeout = 4000,
        },
        cmdline_popup = {
            zindex = 65,
            position = {
                row = "50%",
                col = "50%",
            },
            size = {
                width = "auto",
                height = "auto",
            },
        },
        popupmenu = {
            zindex = 60,
            relative = "editor",
            position = {
                row = "auto",
                col = "auto",
            },
            size = {
                row = "50%",
                col = "50%",
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { normal = "normal", floatborder = "diagnosticinfo" },
            },
        },
        notify = {
            replace = true,
            merge = true,
        }
    },
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
    status = {},
    format = {},
})

-- Load telescope
require("telescope").load_extension("noice")
