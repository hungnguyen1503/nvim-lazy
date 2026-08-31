-- Placeholder list used when no local project_dirs.lua exists (fresh clones).
if vim.fn.has("win32") == 1 then
    return {
        "~\\projects\\my-repo",
        "~\\AppData\\Local\\nvim",
    }
else
    return {
        "~/projects/my-repo/",
        "~/.config/nvim/",
    }
end
