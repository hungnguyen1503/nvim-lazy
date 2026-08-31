local status_ok, project = pcall(require, "neovim-project")
if not status_ok then
    return
end

-- Personal project lists live in lua/plugins/setup/editor/project_dirs.lua
-- (git-ignored); fresh clones fall back to the placeholder list next to it.
local ok, project_dir = pcall(require, "plugins.setup.editor.project_dirs")
if not ok then
    project_dir = require("plugins.setup.editor.project_dirs.example")
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

project.setup(options)
