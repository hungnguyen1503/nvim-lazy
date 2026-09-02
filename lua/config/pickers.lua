local M = {}

--- Fast project file picker: git index inside repos (~0.5 s in a 12k-file repo),
--- fd elsewhere. Used by <leader>fb; <leader>ff is the fd-based all-files picker.
function M.files(opts)
    local fzf = require("fzf-lua")
    local in_repo = vim.fn.finddir(".git", ".;") ~= "" or vim.fn.findfile(".git", ".;") ~= ""
    if in_repo then
        return fzf.git_files(opts)
    end
    return fzf.files(opts)
end

return M
