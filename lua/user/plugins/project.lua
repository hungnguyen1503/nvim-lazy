local status_ok, project = pcall(require, "neovim-project")
if not status_ok then
    return
end

local project_dir
if vim.fn.has("win32") == 1 then
    project_dir = {
        "~\\hungquangnguyen\\FSP\\fsp-rx-v",
        "~\\hungquangnguyen\\FSP\\fsp-rx-ra-test",
        "~\\hungquangnguyen\\FSP\\peaks",
        "~\\hungquangnguyen\\FSP\\wikijs",
        "~\\hungquangnguyen\\FSP\\fsp_gitlab",
        "~\\hungquangnguyen\\FSP\\fsp-dev",
        "~\\hungquangnguyen\\FSP\\fsp-rx-doc-images",
        "~\\hungquangnguyen\\FSP\\08_Tutorial",
        "~\\hungquangnguyen\\CodeTest\\TestC",
        "~\\AppData\\Local\\nvim"
    }
else
    project_dir = {
        "~/workspace_rx/fsp-rx/",
        "~/workspace_rx/wikijs/",
        "~/workspace_rx/wikiRVC/wikijs/",
        "~/data2/hungnguyen/neovim/nvim-lazy/"
    }
end

local options = {
    -- Project directories
    projects = project_dir,
    -- Path to store history and sessions
    datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
    -- Dashboard mode prevent session autoload on startup
    dashboard_mode = true,
    -- Timeout in milliseconds before trigger FileType autocmd after session load
    -- to make sure lsp servers are attached to the current buffer.
    -- Set to 0 to disable triggering FileType autocmd
    filetype_autocmd_timeout = 200,

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
}

project.setup(options)
