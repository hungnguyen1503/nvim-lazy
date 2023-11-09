local status_ok, size_matters = pcall(require, "size-matters")
if not status_ok then
	return
end

size_matters.setup({
    default_mappings = true,
    -- font resize step size
    step_size = 1,
    notifications = {
        enable = true,
        -- ms how long a notification should be displayed (only applies if notify is used)
        timeout = 150,
        -- the notifications position may be affected by the time it takes for the client to re-render
        -- to address this, it can be displayed with a delay.
        delay = 300,
    },
    -- the font loaded when using the reset cmd / shortcut
    reset_font = vim.api.nvim_get_option("guifont"),
})

