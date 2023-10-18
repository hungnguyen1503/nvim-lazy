local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    return
end

local options = {
    keymaps = {
        insert          = "<C-g>s",
        insert_line     = "<C-g>S",
        normal          = "ys",
        normal_cur      = "yss",
        normal_line     = "yS",
        normal_cur_line = "ySS",
        visual          = "S",
        visual_line     = "gS",
        delete          = "ds",
        change          = "cs",
    },
    aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = "'" ,
        ["Q"] = '"' ,
        ["s"] = "`" ,
    },
}

surround.setup(options)
