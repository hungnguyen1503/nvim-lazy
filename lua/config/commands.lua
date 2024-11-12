local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local _general = autogrp("_general", { clear = true })
local group = vim.api.nvim_create_augroup('autosave', {})

--
--[[ ========= Command for settings nvim =========]]
-- Disable automatic comment in newline
autocmd({ "FileType" },
    {
        pattern = "*",
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
        group = _general
    }
)

autocmd({ "CursorHold" },
    {
        pattern = "*",
        command = "set nohlsearch",
    }
)

if vim.fn.has("win32") == 0 then
    autocmd("BufWritePre", {
        pattern = "*",
        command = "setlocal fileformat=unix",
    })
end

-- go to last loc when opening a buffer
-- autocmd("BufReadPost", {
--     callback = function()
--         local mark = vim.api.nvim_buf_get_mark(0, '"')
--         local lcount = vim.api.nvim_buf_line_count(0)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--         vim.opt.laststatus = 3
--     end,
-- })

-- close some filetypes with <q>
autocmd("FileType", {
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Disable statusline in dashboard
autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        -- store current statusline value and use that
        local old_laststatus = vim.opt.laststatus
        autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
            end,
        })
        vim.opt.laststatus = 0
    end,
})
-- Enable spell check for specific language
autocmd("FileType", {
    pattern = "*",
    callback = function()
        local filetype = vim.bo.filetype
        if filetype == 'c' or filetype == 'h' then
            vim.opt.spell = true
        else
            vim.opt.spell = false
        end
    end
})

-- Highlight yank
autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({ timeout = 300 })",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

local alpha_on_empty = autogrp("alpha_on_empty", { clear = true })
autocmd("User", {
    pattern = "BDeletePost*",
    group = alpha_on_empty,
    callback = function(event)
        local fallback_name = vim.api.nvim_buf_get_name(event.buf)
        local fallback_ft = vim.bo[event.buf].filetype
        local fallback_on_empty = fallback_name == "" and fallback_ft == ""

        if fallback_on_empty then
            require("neo-tree").close_all()
            vim.cmd("Alpha")
            vim.cmd(event.buf .. "bwipeout")
            vim.opt.spell = false
            vim.opt.showtabline = 2
        end
    end,
})

autocmd('User', {
    pattern = 'AutoSaveWritePost',
    group = group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            print('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'))
        end
    end,
})

vim.api.nvim_set_hl(0, "@keyword.directive.define.c", { fg = "#ff966c", bold = true }) -- Change this color as needed
vim.api.nvim_set_hl(0, "@keyword.directive.c", { fg = "#ff966c", bold = true })        -- Change this color as needed

vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped' })

vim.api.nvim_create_user_command(
    "DapVirtualTextClear",
    function() require("nvim-dap-virtual-text.virtual_text").clear_virtual_text() end,
    {
        desc = "Clear all the virtual text displayed by nvim-dap-virtual-text",
    }
)
