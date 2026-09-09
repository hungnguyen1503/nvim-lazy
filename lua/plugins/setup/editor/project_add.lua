-- Add a project directory to neovim-project's history without opening the
-- picker. Shared by <leader>fa and the <Ctrl-a> action in the fzf-lua project
-- picker (see plugins/setup/editor/project.lua).
--
-- Paths are stored via the plugin's short_path() (~-relative), matching the
-- format neovim-project itself writes, so history entries stay consistent.
local M = {}

function M.add()
    local path_util = require("neovim-project.utils.path")
    local history = require("neovim-project.utils.history")

    vim.ui.input({ prompt = "Add project directory: ", default = path_util.cwd(),
        completion = "dir" }, function(input)
        if not input or input == "" then
            return
        end
        local dir = path_util.short_path(vim.fn.expand(input))
        if vim.fn.isdirectory(vim.fn.expand(dir)) ~= 1 then
            vim.notify("Not a directory: " .. dir, vim.log.levels.WARN, { title = "Neovim Project" })
            return
        end
        -- Skip if already in history (recent_projects or this session).
        history.make_sure_read_projects_from_history()
        for _, existing in ipairs(history.get_recent_projects()) do
            if path_util.short_path(existing) == dir then
                vim.notify("Already in projects: " .. dir, vim.log.levels.INFO, { title = "Neovim Project" })
                return
            end
        end
        history.add_session_project(dir)
        history.write_projects_to_history()
        vim.notify("Added project: " .. dir, vim.log.levels.INFO, { title = "Neovim Project" })
    end)
end

return M
