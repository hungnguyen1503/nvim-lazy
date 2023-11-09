local status_ok, masondap = pcall(require, "mason-nvim-dap")
if not status_ok then
    return
end

local options = {
    ensure_installed = {
        "cppdbg",
        "bash-debug-adapter",
        "codelldb",
        "cpptools",
        "debugpy",
    },
    automatic_installation = false,
    handlers = {
        function(config)
            -- all sources with no handler get passed here
            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
        end,

        cppdbg = function(config)
            config.adapters = {
                id = 'cppdbg',
                type = 'executable',
                command = vim.fn.exepath('OpenDebugAD7'),
                options = {
                    detached = false,
                },
            }
            config.configurations = {
                {
                    name = "Launch file CPPDGB",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                    setupCommands = {
                        {
                            description = "Setup to resolve symbols",
                            text = "set sysroot /",
                            ignoreFailures = true
                        },
                        {
                            description = "Enable pretty-printing for gdb",
                            text = "-enable-pretty-printing",
                            ignoreFailures = false
                        }
                    },
                },

                -- {
                --     name = 'Attach to gdbserver :1234',
                --     type = 'cppdbg',
                --     request = 'launch',
                --     MIMode = 'gdb',
                --     miDebuggerPath = 'C:\\Renesas\\rcar-xos\\v3.8.0\\tools\\toolchains\\mingw64\\bin\\gdb.exe',
                --     cwd = '${workspaceFolder}',
                --     program = function()
                --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
                --     end,
                -- },
            }
            masondap.default_setup(config)
        end,
        --
        codelldb = function(config)
            config.configurations = {
                {
                    name = 'LLDB: Launch file',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = true,
                    args = {},
                },
            }
            masondap.default_setup(config)
        end,
    }
}

masondap.setup(options)
