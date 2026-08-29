return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.gitsigns")
        end,
    },
    {
        "gbprod/yanky.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "kkharji/sqlite.lua",
        config = function()
            require("plugins.setup.yanky")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        config = function()
            require("plugins.setup.lazygit")
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.setup.diffview")
        end,
    },
}
