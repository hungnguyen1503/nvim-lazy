local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

neoscroll.setup({
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing = "cubic",
    pre_hook = function(info)
        if info == "cursorline" then
            vim.wo.cursorline = false
        end
    end,
    post_hook = function(info)
        if info == "cursorline" then
            vim.wo.cursorline = true
        end
    end,
    performance_mode = false,
})
