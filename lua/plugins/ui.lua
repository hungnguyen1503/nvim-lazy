return {
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.devicons")
        end,
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("plugins.setup.alpha")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPost",
        config = function()
            require("plugins.setup.lualine")
        end,
    },
    {
        "Bekaboo/dropbar.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.dropbar")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = { "BufReadPost", "BufWinEnter", "FileWritePost" },
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.bufferline")
        end,
    },
    { "famiu/bufdelete.nvim", event = "VeryLazy" },
    {
        "matbme/JABS.nvim",
        cmd = "JABSOpen",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.jabs")
        end,
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.notify")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            require("plugins.setup.noice")
        end,
    },
    { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.neoscroll")
        end,
    },
}
