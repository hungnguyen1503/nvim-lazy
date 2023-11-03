local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local _general = autogrp("_general", { clear = true })

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

-- Auto reload content changed outside
autocmd({ "CursorHold,CursorHoldI,FocusGained,BufEnter " },
    {
        pattern = "*",
        command = "checktime",
        group = _general
    }
)

autocmd({ "FocusGained,BufEnter,CursorHold,CursorHoldI" },
    {
        pattern = "*",
        command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''| checktime |endif",
        group = _general
    }
)

autocmd({ "FileChangedShellPost" },
    {
        pattern = "*",
        command = "echohl WarningMsg | echohl None",
        group = _general
    }
)

autocmd({ "CursorHold" },
    {
        pattern = "*",
        command = "set nohlsearch",
    }
)

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
        vim.opt.laststatus = 3
    end,
})

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
    pattern = "c",
    callback = function()
        vim.opt.spell = true
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
        local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
        local fallback_on_empty = fallback_name == "" and fallback_ft == ""

        if fallback_on_empty then
            require("neo-tree").close_all()
            vim.cmd("Alpha")
            vim.cmd(event.buf .. "bwipeout")
            vim.opt.spell = false
        end
    end,
})

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })

vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped' })
