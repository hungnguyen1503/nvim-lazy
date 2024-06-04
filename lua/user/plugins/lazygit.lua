local lazygit = {
    lazygit_floating_window_winblend = 0, -- transparency of floating window
    lazygit_floating_window_scaling_factor = 0.9, -- scaling factor for floating window
    lazygit_floating_window_corner_chars = { '╭', '╮', '╰', '╯' }, -- customize lazygit popup window corner characters
    lazygit_floating_window_use_plenary = 0, -- use plenary.nvim to manage floating window if available
    lazygit_use_neovim_remote = 0, -- fallback to 0 if neovim-remote is not installed
    lazygit_use_custom_config_file_path = 0,
}
for k, v in pairs(lazygit) do
    vim.g[k] = v
end

vim.api.nvim_create_autocmd({ "BufEnter" },
    {
        pattern = "*",
        command = ":lua require('lazygit.utils').project_root_dir()",
    }
)

