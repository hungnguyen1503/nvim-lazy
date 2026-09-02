local ok, jabs = pcall(require, "jabs")
if not ok then
    return
end

jabs.setup({
    position = { "right", "bottom" },
    relative = "editor",
    width = 60,
    height = 10,
    border = "rounded",
    sort_mru = true,
    split_filename = true,
    split_filename_path_width = 20,
    preview_position = "top",
    preview = { width = 70, height = 30, border = "rounded" },
    keymap = { close = "d", jump = "<cr>", h_split = "h", v_split = "v", preview = "<space>" },
    use_devicons = true,
    -- JABS hardcodes pre-Nerd-Fonts-3 codepoints (U+F63D/F746/FB18/F83D/F707/F8EA)
    -- which are missing from CaskaydiaCove NF 3.2.1 and render as tofu;
    -- override with BMP glyphs verified present in the installed font.
    symbols = {
        current = "●",     -- buffer in current window
        split = "▣",       -- buffer in a split window
        alternate = "◆",   -- alternate buffer
        hidden = "○",      -- buffer not visible in any window
        locked = "■",      -- locked buffer
        ro = "◇",          -- read-only buffer
        edited = "•",      -- modified buffer
    },
})
