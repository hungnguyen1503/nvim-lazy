local options = {
    -- Configuration mouse usage
    mouse          = "a",
    mousemodel     = "extend",
    mousemoveevent = true,
    -- completeopt    = { "menu", "menuone", "noselect" },

    -- Tab
    smarttab       = true,
    tabstop        = 4,
    shiftwidth     = 4,
    softtabstop    = 4,
    expandtab      = true,
    list           = true,
    shiftround     = true,

    -- Fold
    -- fillchars      = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
    -- foldcolumn     = "0", -- '0' is not bad
    -- foldlevel      = 99, -- Using ufo provider need a large value, feel free to decrease the value
    -- foldlevelstart = 99,
    -- foldenable     = true,

    -- Disable backup
    backup         = false,
    wb             = false,
    swapfile       = false,

    -- Text editor
    smartcase      = true,
    ignorecase     = true,
    fileencoding   = "utf-8",
    textwidth      = 200,
    cursorline     = true,

    -- Limited height box suggestion
    pumheight      = 15,
    cmdheight      = 1,

    -- Time to update nvim, delay between multi shortcut
    updatetime     = 300,
    timeoutlen     = 500,

    -- Auto load the file when modified externally
    autoread = true,

    -- Wrap text
    wrap           = false,
    linebreak      = true,

    -- Show number
    numberwidth    = 3,
    relativenumber = true,
    number         = true,
    ruler          = false,
    laststatus     = 3,
    signcolumn     = "yes",

    -- Split window
    splitbelow     = true,
    splitright     = true,

    -- Color and font
    termguicolors  = true,
    -- guifont       = "CaskaydiaCove Nerd Font Propo:h13.0",
    guifont        = "CaskaydiaCove Nerd Font:h11.5",
    -- guifont        = "CaskaydiaCove Nerd Font:h10.5",
    wildmenu       = true,
    synmaxcol      = 200,
    spelllang      = 'en_us',
    spell          = false,
    inccommand     = "split", -- show the effects of a search / replace in a live preview window
}

vim.opt.syntax.minlines = 60
vim.opt.syntax.maxlines = 120

vim.g.mapleader = ","
for k, v in pairs(options) do
    vim.opt[k] = v
end

if vim.fn.has("win32") == 1 then
    vim.opt.clipboard = "unnamedplus"
else
    vim.opt.clipboard = "unnamed"
end

-- neovide
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_transparency = 1
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 60
    vim.g.neovide_no_idle = true
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_touch_drag_timeout = 0
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_scroll_animation_length = 0.4
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_vfx_particle_density = 0.2
    vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_floating_blur_amount_x = 0.0
    vim.g.neovide_floating_blur_amount_y = 0.0
    vim.g.neovide_cursor_unfocused_outline_width = 0
end
