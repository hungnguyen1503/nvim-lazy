--- wezterm.lua
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file

local wezterm = require 'wezterm'
local mux = wezterm.mux

-- Plugin for WezTerm
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local default_cwd = "C:/Users/a5134005/hungquangnguyen/FSP"

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
    local window = mux.spawn_window(cmd or {})
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
        brights = { "#444a73", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#c8d3f5" },
        ansi = { "#1b1d2b", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#828bb8" },

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
                bg_color = "#181825",
            },
            inactive_tab_hover = {
                fg_color = "#82aaff",
                bg_color = "#2f334d",
            },
            new_tab_hover = {
                fg_color = "#82aaff",
                bg_color = "#181825",
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
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false
config.tab_and_split_indices_are_zero_based = true

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
-- Common paths and addresses
local coder_base_url = "http://coder.hcmflexbuild001.rvc.renesas.com/"
local rx_coder_sing_url = "http://10.230.228.121:8080/"
local rx_coder_mini_url = "http://coder.codermini1.rvc.renesas.com/"

-- Helper function to create a coder login entry
local function coder_login_entry(label, url)
    return {
        label = "Login to " .. label,
        args = { "coder", "login", url },
    }
end
config.launch_menu = {
    {
        label = 'Bash',
        args = { 'bash', '-l' },
        cwd = default_cwd
    },
    {
        label = 'Zsh',
        args = { 'zsh' },
        cwd = default_cwd
    },
    {
        label = 'PowerShell',
        args = { 'C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe' },
        cwd = default_cwd
    },
    -- Install package automatically
    {
        label = 'Install package for FSP',
        args = { 'bash', 'C:\\Users\\a5134005\\hungquangnguyen\\FSP\\08_Tutorial\\install_pack_rx.sh' },
    },
    {
        label = "SSH to Pi RX (10.23.9.131)",
        args = { "ssh", "rvc@10.231.9.131" },
    },
    {
        label = "SSH to Coder HCM1 (RXFSP)",
        args = { "ssh", "coder.RXFSP" },
    },
    {
        label = "Coder configure SSH",
        args = { "coder", "config-ssh" },
    },
    -- Coder Logins
    coder_login_entry("RA Coder HCM1", coder_base_url),
    coder_login_entry("RX Coder Sing", rx_coder_sing_url),
    coder_login_entry("RX Coder Mini", rx_coder_mini_url),
    coder_login_entry("Coder configure SSH", rx_coder_mini_url),
}

-- Default terminal startup
config.default_prog = { "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe" }

-- Set the default directory where WezTerm will start
config.default_cwd = default_cwd

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
        action = wezterm.action.PasteFrom('Clipboard'), -- Paste on right click
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
    { key = "v",          mods = "CTRL",       action = wezterm.action.PasteFrom("Clipboard") },

    -- Search
    { key = "f",          mods = "CTRL|SHIFT", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },

    -- Switch Workspace
    { key = "s",          mods = "ALT",        action = workspace_switcher.switch_workspace(), } }

-- Create tab activation keys in a loop (1-7)
for i = 1, 7 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i - 1)
    })
end

-- NOTE: Set up tabline for WezTerm
tabline.setup({
    options = {
        icons_enabled = true,
        theme = 'Catppuccin Mocha',
        color_overrides = {},
        section_separators = {
            left = wezterm.nerdfonts.pl_left_hard_divider,
            right = wezterm.nerdfonts.pl_right_hard_divider,
        },
        component_separators = {
            left = wezterm.nerdfonts.pl_left_soft_divider,
            right = wezterm.nerdfonts.pl_right_soft_divider,
        },
        tab_separators = {
            left = wezterm.nerdfonts.pl_left_hard_divider,
            right = wezterm.nerdfonts.pl_right_hard_divider,
        },
    },
    sections = {
        tabline_a = { 'mode' },
        tabline_b = { 'workspace' },
        tabline_c = { ' ' },
        tab_active = {
            'index',
            { 'parent', padding = 0 },
            '/',
            { 'cwd',    padding = { left = 0, right = 1 } },
            { 'zoomed', padding = 0 },
        },
        tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
        tabline_x = { 'ram', 'cpu' },
        tabline_y = { 'datetime', 'battery' },
        tabline_z = { 'hungquangnguyen' },
    },
    extensions = {},
})

-- Config format for smart switch workspace.
workspace_switcher.workspace_formatter = function(label)
    return wezterm.format({
        { Attribute = { Italic = true } },
        { Foreground = { Color = "#c3e88d" } },
        { Background = { Color = "#1b1d2b" } },
        { Text = "󱂬: " .. label },
    })
end

-- Load extension configuration
tabline.apply_to_config(config)
workspace_switcher.apply_to_config(config)

return config
