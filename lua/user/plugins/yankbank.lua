local status_ok, yankbank = pcall(require, "yankbank")
if not status_ok then
    return
end

local options = {
    max_entries = 12,
    sep = "",
    keymaps = {
        navigation_next = "j",
        navigation_prev = "k",
    },
    num_behavior = "prefix",
}

yankbank.setup(options)

