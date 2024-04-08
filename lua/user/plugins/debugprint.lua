local status_ok, debugprint = pcall(require, "debugprint")
if not status_ok then
    return
end

local options = {
    keymaps = {
        normal = {
            plain_below = "<leader>dp",
            plain_above = "<leader>dP",
            variable_below = "<leader>dv",
            variable_above = "<leader>dV",
            variable_below_alwaysprompt = nil,
            variable_above_alwaysprompt = nil,
            textobj_below = "g?o",
            textobj_above = "g?O",
            toggle_comment_debug_prints = "<leader>gc",
            delete_debug_prints = "<leader>da",
        },
        visual = {
            variable_below = "<leader>dv",
            variable_above = "<leader>dV",
        },
    },
    commands = {
        toggle_comment_debug_prints = "ToggleCommentDebugPrints",
        delete_debug_prints = "DeleteDebugPrints",
    },
}

debugprint.setup(options)
