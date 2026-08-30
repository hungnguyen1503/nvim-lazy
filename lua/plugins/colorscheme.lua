return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("plugins.setup.colorscheme.tokyonight")
        end,
    },
}
