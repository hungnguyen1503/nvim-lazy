local status_ok, move = pcall(require, "move")
if not status_ok then
    print("Error: move")
    return
end

local options = {
    line = {
        enable = true, -- Enables line movement
        indent = true -- Toggles indentation
    },
    block = {
        enable = true, -- Enables block movement
        indent = true -- Toggles indentation
    },
    word = {
        enable = true, -- Enables word movement
    },
    char = {
        enable = true -- Enables char movement
    }
}

move.setup(options)
