local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
    return
end

tokyonight.setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",    -- The theme is used when the background is set to light
    transparent = false,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true, fg = '#5c6370' },
        keywords = { italic = false, fg = '#FFB86C' },
        functions = { fg = '#ff79c6' },
        variables = { fg = '#f9f2eb' },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "moon",           -- style for sidebars, see below
        floats = "storm",            -- style for floating windows
    },
    sidebars = {},                   -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,            -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true,             -- dims inactive windows
    lualine_bold = true,             -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    on_highlights = function(highlights, colors)
        highlights.Winbar = {
            ctermbg = 0,
            bg = '#222436'
        }
        highlights.WinbarNC = {
            ctermbg = 0,
            bg = '#222436'
        }
        highlights.IblScope = {
            ctermbg = 0,
            fg = '#fca7ca'
        }
        highlights.DapBreakpoint = {
            ctermbg = 0,
            fg = '#993939'
        }
        highlights.DapLogPoint = {
            ctermbg = 0,
            fg = '#61afef'
        }
        highlights.DapStopped = {
            ctermbg = 0,
            fg = '#98c379'
        }
        highlights.PreProc = {
            ctermbg = 0,
            fg = '#61afef'
        }
    end,
})

tokyonight.load()
