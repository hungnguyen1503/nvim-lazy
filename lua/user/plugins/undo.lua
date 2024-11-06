local status_ok, undo = pcall(require, "highlight-undo")
if not status_ok then
    return
end

local options = {
    duration = 300,
    keymaps = {
        undo = {
            desc = "undo",
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'u',
            rhs = nil,
            opts = {},
        },
        redo = {
            desc = "redo",
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = '<C-r>',
            rhs = nil,
            opts = {},
        },
    },
}

undo.setup(options)
