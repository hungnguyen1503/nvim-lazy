local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
    print("Error: better_escape")
    return
end

-- lua, default settings
local options = {
    timeout = vim.o.timeoutlen,
    mappings = {
        i = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        c = {
            j = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        t = {
            j = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        v = {
            j = {
                k = "<Esc>",
            },
        },
        s = {
            j = {
                k = "<Esc>",
            },
        },
    }
}

better_escape.setup(options)
