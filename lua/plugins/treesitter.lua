return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main", -- master is frozen and broken on nvim 0.11+ (iter_matches node-list change)
        lazy = false, -- main branch does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            require("plugins.setup.treesitter.treesitter")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "xml" },
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {},
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
