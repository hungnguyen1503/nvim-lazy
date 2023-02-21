local status_ok, drop = pcall(require, "drop")
if not status_ok then
    return
end

local options = {
    theme = "leaves", -- can be one of rhe default themes, or a custom theme
    max = 40, -- maximum number of drops on the screen
    interval = 10, -- every 150ms we update the drops
    screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
    filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
}

drop.setup(options)
