local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local status_ok, install = pcall(require, "nvim-treesitter.install")
if not status_ok then
    return
end

local options = {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    textobjects = { enable = true },
    incremental_selection = { enable = true },
    indent  = { enable = true },
    matchup = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },

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
