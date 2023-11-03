local status_ok, auto_indent = pcall(require, "auto-indent")
if not status_ok then
    return
end

local options = {
    lightmode = true, -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
    indentexpr = function(lnum)
        return require("nvim-treesitter.indent").get_indent(lnum)
    end,
    ignore_filetype = {}, -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
}

auto_indent.setup(options)
