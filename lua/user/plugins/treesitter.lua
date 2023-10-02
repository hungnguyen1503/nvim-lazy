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
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
    },
    indent  = { enable = true },
    matchup = { enable = true },
    endwise = { enable = true },
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
