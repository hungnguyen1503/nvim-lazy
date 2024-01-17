local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local status_ok, install = pcall(require, "nvim-treesitter.install")
if not status_ok then
    return
end

local options = {
    highlight             = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filesize = 1000 * 1024 -- 1 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    incremental_selection = { enable = true },
    indent                = { enable = true },
    matchup               = { enable = true },
    endwise               = { enable = true },
    autotag               = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
    },
    textobjects           = {
        -- NOTE: Build in text objects.
        -- @block.inner
        -- @block.outer
        -- @call.inner
        -- @call.outer
        -- @class.inner
        -- @class.outer
        -- @comment.outer
        -- @conditional.inner
        -- @conditional.outer
        -- @frame.inner
        -- @frame.outer
        -- @function.inner
        -- @function.outer
        -- @loop.inner
        -- @loop.outer
        -- @parameter.inner
        -- @parameter.outer
        -- @scopename.inner
        -- @statement.outer
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["a/"] = "@comment.outer",
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]p"] = "@parameter.inner",
                ["]c"] = "@comment.outer",
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]P"] = "@parameter.inner",
                ["]C"] = "@comment.outer",
            },
            goto_previous_start = {
                ["[p"] = "@parameter.inner",
                ["[c"] = "@comment.outer",
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
            },
            goto_previous_end = {
                ["[P"] = "@parameter.inner",
                ["[C"] = "@comment.outer",
            },
        }
    }
}

treesitter.setup(options)

if vim.fn.has("win32") == 0 then
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },
        ensure_installed = {
            "lua",
            "c",
            "cpp",
            "cmake",
            "python",
            "yaml",
            "json",
            "bash",
            "markdown",
            "markdown_inline",
            "make",
        }
    }
end

install.compilers = { "x86_64-w64-mingw32-clang" }
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
