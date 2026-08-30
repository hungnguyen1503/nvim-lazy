local ok, auto_indent = pcall(require, "auto-indent")
if not ok then
    return
end

auto_indent.setup({
    lightmode = true,
    indentexpr = function(lnum)
        return require("nvim-treesitter.indent").get_indent(lnum)
    end,
})
