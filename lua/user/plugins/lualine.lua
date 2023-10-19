local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local filename = {
    'filename',
    icon = "  ",
    file_status = true, -- Displays file status (readonly status, modified status)
    newfile_status = true, -- Display new file status (new file means no write after created)
    path = 0, -- 0: Just the filename
    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    symbols = {
        modified = ' ', -- Text to show when the file is modified.
        readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[Unnamed]  ', -- Text to show for unnamed buffers.
        newfile = '[New]  ', -- Text to show for new created file before first writting
    },
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "hint" },
    symbols = { error = " ", warn = " ", hint = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = " ",
}

local diff = {
    "diff",
    colored = true,
    symbols = {
        added = "  ",
        modified = "  ",
        removed = "  "
    }, -- changes diff symbols
    cond = hide_in_width
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

local modes = {
    ["n"] = " NORMAL",
    ["niI"] = " NORMAL i",
    ["niR"] = " NORMAL r",
    ["niV"] = " NORMAL v",
    ["no"] = " N-PENDING",
    ["i"] = " INSERT",
    ["ic"] = " INSERT (completion)",
    ["ix"] = " INSERT completion",
    ["t"] = " TERMINAL",
    ["nt"] = " NTERMINAL",
    ["v"] = " VISUAL",
    ["V"] = " V-LINE",
    ["Vs"] = " V-LINE (Ctrl O)",
    [""] = " V-BLOCK",
    ["R"] = " REPLACE",
    ["Rv"] = " V-REPLACE",
    ["s"] = " SELECT",
    ["S"] = " S-LINE",
    [""] = " S-BLOCK",
    ["c"] = " COMMAND",
    ["cv"] = " COMMAND",
    ["ce"] = " COMMAND",
    ["r"] = " PROMPT",
    ["rm"] = " MORE",
    ["r?"] = " CONFIRM",
    ["!"] = " SHELL",
}

local mode = function()
    return modes[vim.api.nvim_get_mode().mode] or "__"
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsp_status = {
    function()
        local msg = 'none'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = "  LSP:~",
}

-- LSP STUFF
local lsp_progress = {
    function()
        if not rawget(vim, "lsp") then
            return ""
        end

        local Lsp = vim.lsp.util.get_progress_messages()[1]

        if vim.o.columns < 120 or not Lsp then
            return ""
        end

        local msg = Lsp.message or ""
        local percentage = Lsp.percentage or 0
        local title = Lsp.title or ""
        local spinners = { "", "" }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

        return (content) or ""
    end
}
-- cool function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        -- theme = theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
            "alpha", "dashboard"
        },
        always_divide_middle = true,
        ignore_focus = {},
        globalstatus = true,
        refresh = {
            statusline = 500,
            tabline = 500,
            winbar = 500,
        }
    },
    -- sections = process_sections {
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, filename, diff, diagnostics },
        lualine_c = {},
        lualine_x = {}, --lsp_progress
        lualine_y = { 'searchcount', lsp_status, spaces, 'location' },
        lualine_z = { progress }
    },
    inactive_sections = {

        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
