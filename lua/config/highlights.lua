-- Highlight overrides applied AFTER the colorscheme loads (required from init.lua
-- after lazy.setup, matching the previous sourcing order).
vim.api.nvim_set_hl(0, "@keyword.directive.define.c", { fg = "#ff966c", bold = true }) -- Change this color as needed
vim.api.nvim_set_hl(0, "@keyword.directive.c", { fg = "#ff966c", bold = true }) -- Change this color as needed
