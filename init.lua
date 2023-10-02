vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)
-- bootstrap the lazy.nvim, the LazyVim and your plugins
require("user")
require("core")

pcall(require, "config")
require("core.utils").load_mappings()
