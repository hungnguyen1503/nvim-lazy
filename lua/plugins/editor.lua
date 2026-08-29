return {
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.surround")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.setup.autopairs")
        end,
    },
    {
        "abecodes/tabout.nvim",
        event = "InsertEnter",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.setup.tabout")
        end,
    },
    {
        "fedepujol/move.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.move")
        end,
    },
    {
        "chrisgrieser/nvim-spider",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.spider")
        end,
    },
    {
        "folke/flash.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.flash")
        end,
    },
    {
        "smoka7/hop.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hop").setup({})
        end,
    },
    {
        "hinell/duplicate.nvim",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            vim.g["duplicate-nvim-config"] = { visual = { selectAfter = true, block = true } }
        end,
    },
    { "foosoft/vim-argwrap", cmd = "ArgWrap" },
    {
        "tzachar/highlight-undo.nvim",
        keys = { { "u" }, { "<C-r>" } },
        config = function()
            require("plugins.setup.undo")
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.comment")
        end,
    },
    {
        "Shatur/neovim-session-manager",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.session")
        end,
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.fzf")
        end,
    },
    {
        "coffebar/neovim-project",
        lazy = false,
        priority = 50,
        dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua", "Shatur/neovim-session-manager" },
        init = function()
            vim.opt.sessionoptions:append("globals")
        end,
        config = function()
            require("plugins.setup.project")
        end,
    },
    {
        "voldikss/vim-floaterm",
        cmd = { "FloatermToggle", "FloatermNew", "FloatermShow" },
        config = function()
            require("plugins.setup.floaterm")
        end,
    },
    {
        "okuuva/auto-save.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.autosave")
        end,
    },
    {
        "Vonr/align.nvim",
        branch = "v2",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.illuminate")
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("plugins.setup.colorizer")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.blankline")
        end,
    },
    {
        "vidocqh/auto-indent.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.setup.autoindent")
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.setup.todo")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.setup.trouble")
        end,
    },
    {
        "mrcjkb/nvim-lastplace",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            vim.g.nvim_lastplace = {
                ignore_buftype = { "quickfix", "nofile", "help" },
                ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                open_folds = true,
            }
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.setup.spectre")
        end,
    },
    {
        "ravibrock/spellwarn.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.spellwarn")
        end,
    },
    { "gbprod/stay-in-place.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
    {
        "Kicamon/markdown-table-mode.nvim",
        ft = "markdown",
        config = function()
            require("markdown-table-mode").setup({ filetype = { "*.md" } })
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        config = function()
            require("plugins.setup.markview")
        end,
    },
    {
        "stevearc/overseer.nvim",
        cmd = { "OverseerRun", "OverseerToggle" },
        config = function()
            require("plugins.setup.overseer")
        end,
    },
}
