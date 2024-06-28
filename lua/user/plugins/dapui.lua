local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    return
end

local options = {
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "rounded",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.3
                },
                {
                    id = "breakpoints",
                    size = 0.3
                },
                -- {
                --     id = "stacks",
                --     size = 0.25
                -- },
                {
                    id = "watches",
                    size = 0.4
                }
            },
            position = "left",
            size = 40
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 0.4
                },
                {
                    id = "console",
                    size = 0.6
                }
            },
            position = "bottom",
            size = 15
        }
    },
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
}

-- Load config
dapui.setup(options)

local dap = require("dap")
dap.listeners.after.event_initialized.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
dap.listeners.before.disconnect.dapui_config = function()
    dapui.close()
end
