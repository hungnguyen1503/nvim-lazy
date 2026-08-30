return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("plugins.setup.treesitter.treesitter")
        end,
    },
    {
        "RRethy/nvim-treesitter-endwise",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "xml" },
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.setup.treesitter.rainbow")
        end,
    },
}
