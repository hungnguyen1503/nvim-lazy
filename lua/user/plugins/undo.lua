local status_ok, undo = pcall(require, "highlight-undo")
if not status_ok then
    return
end

local options = {
    duration = 300,
    keymaps = {
        Keymap_name = {
            -- most fields here are the same as in vim.keymap.set
            desc = "a description",
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'lhs',
            rhs = 'optional, can be nil',
            opts = {
            -- same as opts to vim.keymap.set. if rhs is nil, there should be a
            -- callback key which points to a function
            },
        },
    },
}

undo.setup(options)
