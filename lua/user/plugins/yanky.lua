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
        update_register_on_cycle = false, -- EXPERIMENTAL
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
                    ["<c-p>"] = mapping.put("p"),
                    ["<c-s-p>"] = mapping.put("P"),
                    ["<c-x>"] = mapping.delete(),
                    ["<c-r>"] = mapping.set_register(utils.get_default_register()),
                },
                n = {
                    p = mapping.put("p"),
                    P = mapping.put("P"),
                    x = mapping.delete(),
                    r = mapping.set_register(utils.get_default_register())
                },
            }
        },
    },
    system_clipboard = {
        sync_with_ring = true,
    },
    highlight = {
        on_put = false,
        on_yank = true,
        timer = 300,
    },
    preserve_cursor_position = {
        enabled = true,
    },
    textobj = {
        enabled = false,
    },
}

yanky.setup(options)
