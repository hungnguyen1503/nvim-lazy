local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.55,
        width = 0.65,
        row = 0.40,
        col = 0.50,
        border = "rounded",
    },
    -- File pickers are list-only: no preview buffer, syntax highlighting, or preview process.
    previewer = false,
    files = {
        -- Keep the normal picker bounded to project files. <leader>fa remains the exhaustive picker.
        fd_opts = "--type f --exclude .git --exclude node_modules --exclude .venv --exclude .cache",
    },
    git = {
        files = {
            -- tracked + new untracked files; skips submodule contents (<leader>fa scans everything)
            cmd = "git ls-files --exclude-standard --cached --others",
        },
    },
})

fzf.register_ui_select()
