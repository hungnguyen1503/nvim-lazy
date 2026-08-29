return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function()
            require("plugins.setup.neotree")
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        version = "2.*",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.window-picker")
        end,
    },
}
