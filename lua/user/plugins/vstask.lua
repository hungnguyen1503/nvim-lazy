local status_ok, vstask = pcall(require, "vstask")
if not status_ok then
    print("Error: vstask")
    return
end

local options = {
    cache_json_conf = true, -- don't read the json conf every time a task is ran
    cache_strategy = "last", -- can be "most" or "last" (most used / last used)
    config_dir = ".vscode", -- directory to look for tasks.json and launch.json
    use_harpoon = true,     -- use harpoon to auto cache terminals
    telescope_keys = {      -- change the telescope bindings used to launch tasks
        vertical = '<C-v>',
        split = '<C-p>',
        tab = '<C-t>',
        current = '<CR>',
    },
    autodetect = { -- auto load scripts
        npm = "on"
    },
    terminal = 'toggleterm',
    term_opts = {
        vertical = {
            direction = "vertical",
            size = "80"
        },
        horizontal = {
            direction = "horizontal",
            size = "10"
        },
        current = {
            direction = "float",
        },
        tab = {
            direction = 'tab',
        }
    },
    json_parser = require('json5').parse
}

vstask.setup(options)
