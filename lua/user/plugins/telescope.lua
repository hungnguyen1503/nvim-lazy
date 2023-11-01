local present, telescope = pcall(require, "telescope")

if not present then
    return
end

local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        wrap_results = "true",
        shorten_path = true,
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_ignore_patterns = { "node_modules", ".docker", ".git" },
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.90,
            height = 0.90,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "tail" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        set_env = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["q"] = require("telescope.actions").close,
            },
            i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["<C-q>"] = require("telescope.actions").close,
            },
        },
    },

    extensions = {
        file_browser = {
            layout_config = {
                prompt_position = 'top',
                preview_width = 0.55
            },
        },
        project = {
            display_type = "full",
            theme = 'dropdown',
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false
        },
        menu = {
            Sessions = {
                items = {
                    { "Load session", "SessionManager load_session" },
                    { "Load last session", "SessionManager load_last_session" },
                    { "Load current dir session", "SessionManager load_current_dir_session" },
                    { "Save current session", "SessionManager save_current_session" },
                    { "Delete session", "SessionManager delete_session" },
                },
            },
            default = {
                items = {
                    { "Split window vertically", "vsplit" },
                    { "Split window horizontally", "split" },
                    { "Write", "w" },
                },
            },
        },
        ['ui-select'] = {
            layout_config = {
                horizontal = {
                    width = { 0.8, max = 80 },
                    height = { 0.50, max = 30 }
                },
            },
        },
    },

    extensions_list = { "notify", "project", "file_browser", "ui-select", "menu", "dap" },
}

telescope.setup(options)
-- load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)
