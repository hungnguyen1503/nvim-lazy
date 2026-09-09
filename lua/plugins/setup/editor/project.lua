local status_ok, project = pcall(require, "neovim-project")
if not status_ok then
    return
end

-- Personal project lists live in lua/plugins/setup/editor/project_dirs.lua
-- (git-ignored); fresh clones fall back to the placeholder list next to it.
local ok, project_dir = pcall(require, "plugins.setup.editor.project_dirs")
if not ok then
    -- dofile() instead of require(): lazy.nvim's cache loader resolves every
    -- dot in a module name as a directory separator, so a module named
    -- "project_dirs.example" (file project_dirs.example.lua) can never be
    -- require()d.
    local example = vim.fs.find("project_dirs.example.lua",
        { path = vim.fn.stdpath("config") .. "/lua", upward = false })[1]
    project_dir = example and dofile(example) or {}
end

local options = {
    -- Project directories
    projects = project_dir,
    -- Path to store history and sessions
    datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
    -- Load the most recent session on startup if not in the project directory
    last_session_on_startup = true,
    -- Dashboard mode prevent session autoload on startup
    dashboard_mode = true,
    -- Timeout in milliseconds before trigger FileType autocmd after session load
    -- to make sure lsp servers are attached to the current buffer.
    -- Set to 0 to disable triggering FileType autocmd
    filetype_autocmd_timeout = 200,
    forget_project_keys = {
        -- insert mode: Ctrl+d
        i = "<C-d>",
        -- normal mode: d
        n = "d"
    },
    follow_symlinks = "full",

    -- Overwrite some of Session Manager options
    session_manager_opts = {
        autosave_ignore_dirs = {
            vim.fn.expand("~"), -- don't create a session for $HOME/
            "/tmp",
        },
        autosave_ignore_filetypes = {
            -- All buffers of these file types will be closed before the session is saved
            "ccc-ui",
            "gitcommit",
            "gitrebase",
            "qf",
            "toggleterm",
            "alpha",
        },
    },
    -- Picker to use for project selection
    -- Use fzf-lua; it is the only picker configured in this repository.
    -- Fallback to builtin select ui if the specified picker is not available
    picker = {
        type = "fzf-lua",
        preview = {
            enabled = true,
            git_status = false, -- show branch name, an ahead/behind counter, and the git status of each file/folder
            show_hidden = true, -- show hidden files/folders
        },
        opts = {
            -- picker-specific options
        },
    },
}

-- <Ctrl-a> inside the fzf-lua project picker: add a new project directory to
-- the history. neovim-project's picker merges user-supplied `opts.actions`
-- with its own (tbl_deep_extend), so we override the two picker commands and
-- pass a "ctrl-a" action; the plugin's own ctrl-d delete action stays intact.
local function add_project_to_history()
    require("plugins.setup.editor.project_add").add()
end

local function with_add_action(opts)
    opts = opts or {}
    opts.actions = vim.tbl_extend("force", opts.actions or {}, {
        ["ctrl-a"] = function()
            add_project_to_history()
        end,
    })
    return opts
end

-- Re-create the picker commands with the ctrl-a action injected.
local config = require("neovim-project.config")
local picker = require("neovim-project.picker")

do
    local project_module = require("neovim-project.project")
    vim.api.nvim_create_user_command("NeovimProjectDiscover", function(args)
        -- Default to "history" sorting: merges recent-projects (entries added
        -- via <leader>fa / <C-a>) ahead of pattern matches. Plain "default"
        -- lists ONLY dirs matching the `projects` patterns, hiding everything
        -- added to the history.
        config.options.picker.opts.sorting = args.args or "history"
        picker.create_picker(with_add_action(args), true, project_module.switch_project)
    end, { nargs = "?", complete = function()
        return { "history", "default", "alphabetical_name", "alphabetical_path" }
    end })

    vim.api.nvim_create_user_command("NeovimProjectHistory", function(args)
        picker.create_picker(with_add_action(args), false, project_module.switch_project)
    end, {})
end

project.setup(options)

