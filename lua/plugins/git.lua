return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.git.gitsigns")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        config = function()
            require("plugins.setup.git.lazygit")
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.setup.git.diffview")
        end,
    },
}
