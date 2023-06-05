local options = {
    clipboard = "unnamedplus",
    -- Configuration mouse usage
    mouse = "a",
    mousemodel = "popup",
    completeopt = { "menu", "menuone", "noselect" },

    -- Tab
    smarttab = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    list = true,

    -- Disable backup
    backup = false,
    wb = false,
    swapfile = false,

    -- Text editor
    smartcase = true,
    ignorecase = true,
    fileencoding = "utf-8",
    textwidth = 0,
    cursorline = true,

    -- Limited height box suggestion
    pumheight = 15,
    cmdheight = 1,

    -- Time to update nvim, delay between multi shortcut
    updatetime = 250,
    timeoutlen = 800,

    -- Wrap text
    wrap = false,
    linebreak = true,

    -- Show number
    numberwidth = 3,
    relativenumber = true,
    number = true,
    ruler = false,
    laststatus = 3,
    signcolumn = "yes",

    -- Split window
    splitbelow = true,
    splitright = true,

    -- Scroll with offset
    scrolloff = 10, -- minimal number of screen lines to keep above and below the cursor.
    sidescrolloff = 10, -- minimal number of screen lines to keep left and right of the cursor.

    -- Color and font
    termguicolors = true,
    guifont       = "CaskaydiaCove Nerd Font Propo:h13.5",
    -- guifont = "CaskaydiaCove NF:h13",
    -- guifont = "Hack Nerd Font Propo:h13.5",
    -- guifont = "Hack Nerd Font Mono:h13.5",
    wildmenu      = true,
    synmaxcol     = 300,
}

vim.opt.syntax.minlines = 200
vim.opt.syntax.maxlines = 500

vim.g.mapleader = ","
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- neovide
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_transparency = 1
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 60
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_touch_drag_timeout = 0.17
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_cursor_vfx_particle_density = 0.2
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_unfocused_outline_width = 0.125
    vim.g.neovide_fullscreen = false

    -- vim.g.neovide_floating_blur_amount_x = 5.0
    -- vim.g.neovide_floating_blur_amount_y = 5.0
    --
    -- vim.g.neovide_cursor_unfocused_outline_width = 0.125
    -- global.neovide_cursor_vfx_particle_lifetime = 1.2

    -- global.neovide_cursor_vfx_particle_curl = 1.0
    -- global.neovide_cursor_vfx_particle_density = 7.0
    -- global.neovide_cursor_vfx_particle_speed = 10.0
    -- global.neovide_cursor_vfx_particle_phase = 1.5
    -- global.neovide_cursor_vfx_mode = "railgun"
end
