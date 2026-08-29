-- Use Neovim's built-in bytecode loader. impatient.nvim is archived and is
-- unnecessary on supported Neovim versions.
if vim.loader and vim.loader.enable then
    vim.loader.enable()
end

require("config") -- options (mapleader) + autocmds
require("plugins") -- lazy.nvim bootstrap, catalogue, setup
require("config.highlights") -- applied after the colorscheme loads
require("config.utils").load_mappings()
require("cheatsheet")
