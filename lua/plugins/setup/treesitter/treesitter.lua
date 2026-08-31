-- nvim-treesitter "main" branch API: full rewrite, no configs/module system.
-- The plugin only installs parsers and queries; highlight/fold are native
-- Neovim features, indent comes from this plugin. See the plugin README.
local treesitter = require("nvim-treesitter")

-- Keep the language set previously installed via :TSInstall (no-op if present).
treesitter.install({
    "bash", "c", "cmake", "cpp", "html", "json", "json5", "lua",
    "markdown", "markdown_inline", "pug", "python", "vim", "vimdoc", "xml", "yaml",
})

local max_filesize = 1000 * 1024 -- 1 MB

-- Enable native treesitter highlighting per filetype, replacing the old
-- `highlight = { enable = true }` module.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(ev)
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
        if ok and stats and stats.size > max_filesize then
            return
        end
        if not pcall(vim.treesitter.start, ev.buf) then
            return -- no parser for this filetype
        end
        -- Treesitter indentation (experimental, provided by nvim-treesitter).
        -- Falls back to autoindent when no indent query matches.
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
