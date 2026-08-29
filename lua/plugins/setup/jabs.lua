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
})
