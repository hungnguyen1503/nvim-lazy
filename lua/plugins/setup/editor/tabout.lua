local ok, tabout = pcall(require, "tabout")
if not ok then
    return
end

tabout.setup({
    tabkey = "<C-j>",
    backwards_tabkey = "<C-k>",
    act_as_tab = true,
    act_as_shift_tab = true,
    default_tab = "<C-t>",
    default_shift_tab = "<C-d>",
    enable_backwards = true,
    completion = false,
    tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
    },
    ignore_beginning = true,
})
