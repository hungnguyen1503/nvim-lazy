local status_ok, drop = pcall(require, "drop")
if not status_ok then
    return
end

local options = {
    theme = "leaves", -- can be one of rhe default themes, or a custom theme
    max = 15, -- maximum number of drops on the screen
    interval = 12, -- every 150ms we update the drops
    screensaver = false, -- show after 5 minutes. Set to false, to disable
    filetypes = { "alpha" }, -- will enable/disable automatically for the following filetypes
}

drop.setup(options)
