local present, telescope = pcall(require, "telescope")

if not present then
    return
end
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
-- Search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- Do not search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

local options = {
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        hidden = true,
        file_ignore_patterns = { "node_modules", ".docker", ".git" },
        layout_config = {
            center = {
                prompt_position = "top",
                scroll_speed = 5,
            },
            horizontal = {
                prompt_position = "top",
                preview_width = 0.4,
                results_width = 0.6,
                scroll_speed = 5,
            },
            vertical = {
                prompt_position = "top",
                mirror = false,
                scroll_speed = 5,
            },
            width = 0.95,
            height = 0.90,
            preview_cutoff = 120,
        },
        pickers = {
            find_files = {
                find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--follow" }
            },
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        set_env = nil,
        preview = {
            treesitter = true,
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ['<C-h>'] = require('telescope.actions').preview_scrolling_left,
                ['<C-l>'] = require('telescope.actions').preview_scrolling_right,
                ["q"] = require("telescope.actions").close,
            },
            i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ['<C-h>'] = require('telescope.actions').preview_scrolling_left,
                ['<C-l>'] = require('telescope.actions').preview_scrolling_right,
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
        menu = {
            Sessions = {
                items = {
                    { "Load session",             "SessionManager load_session" },
                    { "Load last session",        "SessionManager load_last_session" },
                    { "Load current dir session", "SessionManager load_current_dir_session" },
                    { "Save current session",     "SessionManager save_current_session" },
                    { "Delete session",           "SessionManager delete_session" },
                },
            },
            default = {
                items = {
                    { "Split window vertically",   "vsplit" },
                    { "Split window horizontally", "split" },
                    { "Write",                     "w" },
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

    extensions_list = { "notify", "file_browser", "ui-select", "menu", "dap", "fzf" },
}

telescope.setup(options)

-- Load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)
