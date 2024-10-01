local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "String",
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local fn = vim.fn
local marginTopPercent
if vim.g.neovide then
    marginTopPercent = 0.37
else
    marginTopPercent = 0.28
end
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

-- Footer
local function footer()
    local total_plugins = require("lazy").stats().count
    local version = vim.version()
    local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return " " .. total_plugins .. " plugins" .. nvim_version_info
end

local options = {

    header = {
        type = "text",
        val = {
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        },
        opts = {
            position = "center",
            hl = "Statement",
        },
    },

    buttons = {
        type = "group",
        val = {
            button("ff", "  Find File  ", "<cmd>Telescope find_files<CR>"),
            button("fo", "  Recent File  ", "<cmd>Telescope oldfiles<CR>"),
            button("fw", "  Find Word  ", "<cmd>Telescope live_grep<CR>"),
            button("fp", "  Find Project  ", "<cmd>Telescope neovim-project discover<CR>"),
            button("fm", "  Sessions", "<cmd>SessionManager load_session<CR>"),
            button("fb", "  Bookmarks  ", "<cmd>Telescope marks<CR>"),
            button("ft", "  Themes  ", "<cmd>Telescope themes<CR>"),
            button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
            button("q", "  Quit NVIM", "<cmd>qa<CR>"),
        },
        opts = {
            spacing = 1,
        },
    },
    footer = {
        type = "text",
        val = footer(),
        opts = {
            position = "center",
            hl = "AlphaFooter",
        },
    },
    headerPaddingTop = { type = "padding", val = headerPadding },
    headerPaddingBottom = { type = "padding", val = 2 },
}

alpha.setup {
    layout = {
        options.headerPaddingTop,
        options.header,
        options.headerPaddingBottom,
        options.buttons,
        options.footer
    },
    opts = {},
}

-- Disable statusline in dashboard
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        -- store current statusline value and use that
        local old_laststatus = vim.opt.laststatus
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
            end,
        })
        vim.opt.laststatus = 0
    end,
})
