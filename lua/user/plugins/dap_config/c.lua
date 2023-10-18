local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

-- c/cpp
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.exepath('OpenDebugAD7'),
    -- command = "D:\\Software\\ms-vscode.cpptools-1.17.5-win32-x64\\debugAdapters\\bin\\OpenDebugAD7.exe",
    options = {
        detached = false
    },
}
dap.configurations.c = {
    {
        name = "Launch file cppdbg",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
        end,
        -- program = "D:\\CodeTest\\TestC\\src\\main",
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        MIMode = "gdb",
        miDebuggerPath = "C:\\MinGW\\bin\\gdb.exe",
        setupCommands = {
            {
                description = "Setup to resolve symbols",
                text = "set sysroot /",
                ignoreFailures = false
            },
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = false
            }
        },
    },
}

-- dap.configurations.cpp = dap.configurations.c
