--- wezterm.lua
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file

local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Define custom color schemes
config.color_schemes = {
    ["tokyonight_moon"] = {
        -- Basic colors
        foreground = "#c8d3f5",
        background = "#222436",

        -- Cursor colors
        cursor_bg = "#c8d3f5",
        cursor_border = "#c8d3f5",
        cursor_fg = "#222436",

        -- Selection colors
        selection_bg = "#2d3f76",
        selection_fg = "#c8d3f5",

        -- UI element colors
        split = "#82aaff",
        compose_cursor = "#ff966c",
        scrollbar_thumb = "#2f334d",

        -- ANSI colors
        ansi = { "#1b1d2b", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#828bb8" },
        brights = { "#444a73", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#c8d3f5" },

        -- Tab bar colors
        tab_bar = {
            inactive_tab_edge = "#1e2030",
            background = "#222436",
            active_tab = {
                fg_color = "#1e2030",
                bg_color = "#82aaff",
            },
            inactive_tab = {
                fg_color = "#545c7e",
                bg_color = "#2f334d",
            },
            inactive_tab_hover = {
                fg_color = "#82aaff",
                bg_color = "#2f334d",
            },
            new_tab_hover = {
                fg_color = "#82aaff",
                bg_color = "#222436",
                intensity = "Bold",
            },
            new_tab = {
                fg_color = "#82aaff",
                bg_color = "#222436",
            },
        },
    },
}

-- Set the active color scheme
config.color_scheme = "tokyonight_moon"
-- config.window_background_opacity = 0.5
-- config.macos_window_background_blur = 70
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000

-- Enable Scroll bar
config.enable_scroll_bar = true

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = true
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

-- Dim inactive panes
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8
}

-- Set the animation frame rate
config.animation_fps = 60
config.cursor_blink_rate = 800 -- in milliseconds
config.webgpu_preferred_adapter = nil
config.front_end = "OpenGL"

-- Font settings
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 11.0

config.enable_wayland = false

-- Define the launch menu with various shell options
config.launch_menu = {
    {
        label = 'Bash',
        args = { 'bash', '-l' },
    },
    {
        label = 'PowerShell',
        args = { 'C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe' },
    },
    {
        label = 'Top',
        args = { 'top' },
    },
    {
        label = "SSH to Pi RX",
        args = { "ssh", "rvc@10.231.9.131" }, -- Replace with your username and server address
    },
    {
        label = "SSH to Coder HCM",
        args = { "ssh", "coder.RXFSP" }, -- Replace with your username and server address
    },
}

-- Default terminal startup
config.default_prog = { "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe" }

-- Set the default directory where WezTerm will start
config.default_cwd = "C:/Users/a5134005/hungquangnguyen/FSP"

-- Enable focus follows mouse
config.pane_focus_follows_mouse = true

-- Configure mouse behavior
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = 'Left' } },
        action = wezterm.action.CopyTo('ClipboardAndPrimarySelection'), -- Copy on left click
    },
    {
        event = { Down = { streak = 1, button = 'Right' } },
        action = wezterm.action.PasteFrom('PrimarySelection'), -- Paste on right click
    },
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor, -- Open link under cursor when Ctrl+Left clicking
    },
}

-- Key bindings similar to Windows Terminal
config.keys = {
    -- New tab
    { key = "t",          mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

    { key = "L",          mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },

    -- Close tab
    { key = "w",          mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = false } },

    -- Next tab
    { key = "Tab",        mods = "CTRL",       action = wezterm.action.ActivateTabRelative(1) },

    -- Previous tab
    { key = "Tab",        mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

    -- Split pane horizontally/vertically into a new domain
    { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal { domain = "DefaultDomain" } },
    { key = "DownArrow",  mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical { domain = "DefaultDomain" } },

    -- Navigate between panes
    { key = "LeftArrow",  mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Down") },

    -- Resize panes
    { key = "LeftArrow",  mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize { "Left", 1 } },
    { key = "RightArrow", mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize { "Right", 1 } },
    { key = "UpArrow",    mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize { "Up", 1 } },
    { key = "DownArrow",  mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize { "Down", 1 } },

    -- Copy and Paste
    { key = "c",          mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "v",          mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

    -- Search
    { key = "f",          mods = "CTRL|SHIFT", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
}

-- Create tab activation keys in a loop (1-7)
for i = 1, 7 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i - 1)
    })
end

wezterm.on("update-status", function(window, pane)
    -- Workspace name
    local stat = window:active_workspace()
    local stat_color = "#f7768e"
    -- It's a little silly to have workspace name all the time
    -- Utilize this to display LDR or current key table name
    if window:active_key_table() then
        stat = window:active_key_table()
        stat_color = "#7dcfff"
    end
    if window:leader_is_active() then
        stat = "LDR"
        stat_color = "#bb9af7"
    end

    local basename = function(s)
        -- Nothing a little regex can't fix
        return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end

    -- Current working directory
    local cwd = pane:get_current_working_dir()
    if cwd then
        if type(cwd) == "userdata" then
            -- Wezterm introduced the URL object in 20240127-113634-bbcac864
            cwd = basename(cwd.file_path)
        else
            -- 20230712-072601-f4abf8fd or earlier version
            cwd = basename(cwd)
        end
    else
        cwd = ""
    end

    -- Current command
    local cmd = pane:get_foreground_process_name()
    -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
    cmd = cmd and basename(cmd) or ""

    -- Time
    local time = wezterm.strftime("%H:%M")

    -- Left status (left of the tab line)
    window:set_left_status(wezterm.format({
        { Foreground = { Color = stat_color } },
        { Text = "  " },
        { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
        { Text = " |" },
    }))

    -- Right status
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
        { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
        { Text = " | " },
        { Foreground = { Color = "#e0af68" } },
        { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
        "ResetAttributes",
        { Text = " | " },
        { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
        { Text = "  " },
    }))
end)

return config
