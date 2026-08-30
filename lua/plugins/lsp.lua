return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("plugins.setup.lsp.mason")
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = "MasonToolsInstall",
        dependencies = "williamboman/mason.nvim",
        config = function()
            require("plugins.setup.lsp.mason-tools")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = "saghen/blink.cmp",
        config = function()
            require("plugins.setup.lsp.lspconfig")
            require("plugins.setup.lsp.lspserver")
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
        opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
    },
    {
        "nvimdev/lspsaga.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "anuvyklack/windows.nvim", "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.setup.lsp.lspsaga")
        end,
    },
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        config = function()
            require("plugins.setup.lsp.outline")
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.setup.lsp.fidget")
        end,
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
        opts = {
            keymap = {
                preset = "none",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
            signature = { enabled = true },
            snippets = { preset = "luasnip" },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            fuzzy = { implementation = "prefer_rust" },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
            require("plugins.setup.lsp.luasnip")
        end,
    },
}
