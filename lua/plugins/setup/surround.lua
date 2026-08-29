local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    return
end

local options = {
    -- nvim-surround v4 owns its default mappings. Custom aliases remain part
    -- of the supported setup surface; keymaps no longer are.
    aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = "'",
        ["Q"] = '"',
        ["s"] = "`",
    },
}

surround.setup(options)
