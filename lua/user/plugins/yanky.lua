local status_ok, yanky = pcall(require, "yanky")
if not status_ok then
    return
end

local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

local options = {
    ring = {
        history_length = 100,
        storage = "shada",
        storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
        update_register_on_cycle = false,
    },
    picker = {
        select = {
            action = nil, -- nil to use default put action
        },
        telescope = {
            use_default_mappings = false, -- if default mappings should be used
            mappings = {
                default = mapping.put("p"),
                i = {
                    ["<CR>"] = mapping.put("p"),
                },
                n = {
                    p = mapping.put("p"),
                    P = mapping.put("P"),
                    d = mapping.delete(),
                    r = mapping.set_register(utils.get_default_register())
                },
            }
        },
    },
    system_clipboard = {
        sync_with_ring = true,
        clipboard_register = nil,
    },
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 200,
    },
    preserve_cursor_position = {
        enabled = true,
    },
    textobj = {
        enabled = true,
    },

}

yanky.setup(options)
