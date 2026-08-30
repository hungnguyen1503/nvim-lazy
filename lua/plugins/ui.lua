return {
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.ui.devicons")
        end,
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("plugins.setup.ui.alpha")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPost",
        config = function()
            require("plugins.setup.ui.lualine")
        end,
    },
    {
        "Bekaboo/dropbar.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.ui.dropbar")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = { "BufReadPost", "BufWinEnter", "FileWritePost" },
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.ui.bufferline")
        end,
    },
    {
        "matbme/JABS.nvim",
        cmd = "JABSOpen",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.ui.jabs")
        end,
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.ui.notify")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            require("plugins.setup.ui.noice")
        end,
    },
    { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.ui.neoscroll")
        end,
    },
}
