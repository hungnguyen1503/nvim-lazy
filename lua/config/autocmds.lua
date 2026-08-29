local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local group = autogrp("UserConfiguration", { clear = true })
local autosave_group = autogrp("autosave", {})
local general = autogrp("_general", { clear = true })

-- dont list quickfix buffers
autocmd("FileType", {
    group = group,
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- Disable automatic comment in newline
autocmd({ "FileType" }, {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    group = general,
})

autocmd({ "CursorHold" }, {
    pattern = "*",
    command = "set nohlsearch",
    group = group,
})

if vim.fn.has("win32") == 0 then
    autocmd("BufWritePre", {
        pattern = "*",
        command = "setlocal fileformat=unix",
    })
end

-- close some filetypes with <q>
autocmd("FileType", {
    group = group,
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
    group = group,
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

-- Enable spell check for C sources; buffer-local so other windows never pay the
-- spell-engine rendering cost.
autocmd("FileType", {
    group = group,
    pattern = "*",
    callback = function()
        local ft = vim.bo.filetype
        vim.opt_local.spell = (ft == "c" or ft == "h")
    end,
})

-- Highlight yank
autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({ timeout = 300 })",
    group = autogrp("YankHighlight", { clear = true }),
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
            vim.cmd("Alpha")
            vim.cmd(event.buf .. "bwipeout")
            vim.opt.showtabline = 2
        end
    end,
})

autocmd("User", {
    pattern = "AutoSaveWritePost",
    group = autosave_group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            print("AutoSave: saved " .. filename .. " at " .. vim.fn.strftime("%H:%M:%S"))
        end
    end,
})
