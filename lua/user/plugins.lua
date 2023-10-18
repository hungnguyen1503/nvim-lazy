return {

    -- Icon source (need to be placed at the end)
    {
        'nvim-tree/nvim-web-devicons',
        event = "VeryLazy"
    },

    -- Start up screen
    {
        'goolord/alpha-nvim',
        config = function()
            require("user.plugins.alpha")
        end,
    },

    -- Boost startup time
    {
        'lewis6991/impatient.nvim',
        config = function()
            require("user.plugins.impatient")
        end,
    },

    -- Colorscheme manager
    {
        'folke/tokyonight.nvim',
        config = function()
            require("user.plugins.tokyonight")
        end,
    },

    -- Change font size
    {
        'tenxsoydev/size-matters.nvim',
        event = "WinScrolled",
        cmd = { "FontSizeUp", "FontSizeDown" },
        config = function()
            require("user.plugins.scalefont")
        end,
    },

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly',
        dependencies = {
            "stevearc/dressing.nvim"
        },
        config = function()
            require("user.plugins.nvimtree")
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        event = "BufRead",
        config = function()
            require("user.plugins.lualine")
        end,
    },

    -- Manage buffer
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = "VeryLazy",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("user.plugins.bufferline")
        end
    },

    -- Buffer delete
    {
        'famiu/bufdelete.nvim',
        event = "VeryLazy",
    },

    -- Tab explorer
    {
        'matbme/JABS.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.jabs")
        end,
    },

    {
        -- Git icon
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.gitsigns")
        end,
    },

    -- {
    --     'niuiic/git-log.nvim',
    --     event = "VeryLazy",
    --     dependencies = {
    --         'niuiic/core.nvim'
    --     },
    --     config = function()
    --         require("user.plugins.gitlog")
    --     end,
    --     keys = {
    --         { "<F10>", function() require("git-log").check_log() end, mode = "n", silent = true },
    --     },
    -- },

    -- Git quick command
    {
        'kdheepak/lazygit.nvim',
        cmd = "LazyGit",
        event = "VeryLazy",
        config = function()
            require("user.plugins.lazygit")
        end,
    },

    -- Notify
    {
        'rcarriga/nvim-notify',
        event = "VeryLazy",
        config = function()
            require("user.plugins.notify")
        end
    },

    -- Smooth scrolling
    {
        'karb94/neoscroll.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.neoscroll")
        end,
    },

    -- Git watch diffview
    {
        'sindrets/diffview.nvim',
        pin = true,
        cmd = {
            "DiffviewOpen",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles"
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("user.plugins.diffview")
        end,
    },

    -- Quick edit parentheses
    {
        'kylechui/nvim-surround',
        event = "InsertEnter",
        config = function()
            require("user.plugins.surround")
        end,
    },

    -- Tab tree to enhance navigation within code by leveraging the power of Treesitter
    {
        'roobert/tabtree.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.tabtree")
        end,
    },

    -- Tabout
    {
        'abecodes/tabout.nvim',
        event = {
            "InsertEnter",
            "VeryLazy"
        },
        dependencies = {
            "nvim-treesitter",
            "nvim-cmp",
        },
        config = function()
            require("user.plugins.tabout")
        end
    },

    -- NOTE: Check the new plugin to automate pair
    -- Auto pair
    -- https://github.com/altermo/ultimate-autopair.nvim
    -- {
    --     'windwp/nvim-autopairs',
    --     config = function()
    --         require("user.plugins.autopairs")
    --     end,
    --     event = { "InsertEnter" },
    -- },

    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6',
        config = function()
            require("user.plugins.ultimate_autopair")
        end,
    },

    -- Quick move
    {
        'fedepujol/move.nvim',
        event = "VeryLazy",
    },

    {
        "chrisgrieser/nvim-spider",
        event = "VeryLazy",
        config = function()
            require('user.plugins.spider')
        end
    },

    -- Quick scope move word
    {
        'phaazon/hop.nvim',
        event = "VeryLazy",
        config = function()
            require("hop").setup {}
        end
    },

    -- Quick move with flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require('user.plugins.flash')
        end,
        keys = {
            {
                "<leader>j",
                mode = { "n", "x", "o" },
                function() require("flash").jump() end,
                desc = "Flash"
            },
            {
                "<leader>ft",
                mode = { "n", "x", "o" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            -- {
            --     "<c-s>",
            --     mode = { "c" },
            --     function() require("flash").toggle() end,
            --     desc =
            --     "Toggle Flash Search"
            -- },
        }
    },
    -- Extract argument in bracket
    {
        'foosoft/vim-argwrap',
        event = "VeryLazy",
        cmd = { "ArgWrap" },
    },

    {
        'tzachar/highlight-undo.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.undo")
        end
    },

    -- Quick comment
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.comment")
        end,
    },

    -- Comment box
    {
        'LudoPinelli/comment-box.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.comment-box")
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        -- event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- File browser
            'nvim-telescope/telescope-file-browser.nvim',
            -- Project
            'nvim-telescope/telescope-project.nvim',
            -- UI for telescope
            'nvim-telescope/telescope-ui-select.nvim',
            -- Builtin/extension picker for telescope
            'keyvchan/telescope-find-pickers.nvim',
            -- Menu management
            'octarect/telescope-menu.nvim',
        },
        cmd = "Telescope",
        config = function()
            require("user.plugins.telescope")
        end,
    },

    -- Icon picker
    {
        'ziontee113/icon-picker.nvim',
        event = "VeryLazy",
        cmd = {
            "PickEverything",
            "IconPickerNormal",
            "PickEverythingInsert",
            'IconPickerInsert',
            'IconPickerYank',
        },
        config = function()
            require("user.plugins.icon-picker")
        end
    },

    -- Session manager
    {
        'Shatur/neovim-session-manager',
        -- event = "VeryLazy",
        dependencies = {
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            require("user.plugins.session")
        end
    },

    -- Float terminal
    {
        'voldikss/vim-floaterm',
        event = "VeryLazy",
        commit = 'bcaeabf89a92a924031d471395054d84bd88ce2f',
        cmd = {
            "FloatermToggle",
            "FloatermNew",
            "FloatermShow"
        },
        config = function()
            require("user.plugins.floaterm")
        end,
    },

    -- Replace multiple different words in a file or multiple files
    {
        'AckslD/muren.nvim',
        event = "VeryLazy",
        cmd = {
            "MurenToggle",
            "MurenOpen",
            "MurenFresh",
            "MurenUnique"
        },
        config = function()
            require("user.plugins.muren")
        end
    },

    -- Search and replace single or visual words/lines
    {
        "roobert/search-replace.nvim",
        event = "VeryLazy",
        config = function()
            require("search-replace").setup({
                -- optionally override defaults
                default_replace_single_buffer_options = "gcI",
                default_replace_multi_buffer_options = "egcI",
            })
        end,
    },

    -- NOTE: It should be replace by another plugin
    -- Vim easy replace
    {
        'kqito/vim-easy-replace',
        event = "VeryLazy",
        config = function()
            require("user.plugins.replace")
        end
    },

    -- Code highlight
    {
        'nvim-treesitter/nvim-treesitter',
        pin = true,
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("user.plugins.treesitter")
        end,
    },

    -- End certain structures automatically
    {
        "RRethy/nvim-treesitter-endwise",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- Auto tag for html, xml, ....
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },

    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            -- require("wildfire").setup()
            require("user.plugins.wildfire")
        end,
    },

    -- Syntax aware text-objects, select, move, swap,
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = 'VeryLazy',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require("user.plugins.nvim-treesitter-textobjects")
        end
    },

    -- Bracket rainbow color
    {
        'HiPhish/rainbow-delimiters.nvim',
        -- commit = "43ecaf13c4c3fb3e60294d3f99a0324747379d82",
        event = "VeryLazy",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require("user.plugins.rainbow")
        end
    },

    -- TODO: Add feature autosave after changing current workspace
    {
        'okuuva/auto-save.nvim',
        config = function()
            require("user.plugins.autosave")
        end
    },

    -- Align lines
    {
        'Vonr/align.nvim',
        branch = "v2",
        event = "VeryLazy",
    },

    -- Quick highlight word
    {
        'RRethy/vim-illuminate',
        event = "VeryLazy",
        config = function()
            require("user.plugins.illuminate")
        end
    },

    -- Highlight color into hex color
    {
        'NvChad/nvim-colorizer.lua',
        event = "VeryLazy",
        config = function()
            require("user.plugins.colorizer")
        end
    },

    -- Indent blank line
    {
        'lukas-reineke/indent-blankline.nvim',
        -- tag    = "v2.20.8",
        event  = {
            "BufRead",
            "VeryLazy"
        },
        config = function()
            require("user.plugins.blankline")
        end
    },

    -- Todo comment
    {
        'folke/todo-comments.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.todo")
        end,
    },

    -- Trouble to display error in the source code
    {
        'folke/trouble.nvim',
        cmd = "TroubleToggle",
        event = 'VeryLazy',
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("user.plugins.trouble")
        end
    },

    -- LSP installer
    {
        'williamboman/mason.nvim',
        config = function()
            require("user.plugins.mason")
        end,
        cmd = "Mason",
    },

    -- {
    --     "j-hui/fidget.nvim",
    --     tag = "legacy",
    --     event = {
    --         "LspAttach",
    --         "VeryLazy"
    --     },
    --     config = function ()
    --         require("user.plugins.fidget")
    --     end
    -- },

    -- LSP config manager
    {
        'neovim/nvim-lspconfig',
        config = function()
            require("user.plugins.lspconfig")
            require("user.plugins.lspserver")
        end,
    },

    -- NULL-ls

    {
        'Djancyp/lsp-range-format',
        event = "VeryLazy",
    },

    -- LSP Neodev
    {
        'folke/neodev.nvim',
        ft = "lua",
        config = function()
            require("user.plugins.neodev")
        end
    },

    -- LSP Saga
    {
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        -- commit = "71c1793c86a3fbf405c3100577b72c148ca91d9e",
        config = function()
            require("user.plugins.lspsaga")
        end,
        dependencies = {
            'anuvyklack/windows.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Display lsp progress loading
    -- {
    --     "j-hui/fidget.nvim", -- Display LSP status messages in a floating window
    --     tag = "legacy",
    --     event = "VeryLazy",
    --     config = function()
    --         require("user.plugins.fidget")
    --     end
    -- },

    -- NOTE: Drop snow in dashboard
    -- This plugin is being disabled because of decreasing performance
    -- {
    --     "folke/drop.nvim",
    --     event = "VimEnter",
    --     config = function()
    --         require("user.plugins.drop")
    --     end,
    -- },

    -- NOTE: This plugin can be supportted for neovide with multigrid mode
    -- Show message popup, LSP progress, popup commandline
    {
        'folke/noice.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("user.plugins.noice")
        end,
    },

    -- load luasnips + cmp related in insert mode only
    {
        'rafamadriz/friendly-snippets',
        event = "VeryLazy",
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "friendly-snippets",
            'doxnit/cmp-luasnip-choice',
        },
        config = function()
            require("user.plugins.cmp")
        end,
    },

    -- Tabnine
    {
        'tzachar/cmp-tabnine',
        -- build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "friendly-snippets",
            "nvim-cmp"
        },
        config = function()
            require("user.plugins.luasnip")
        end,
    },
    {
        'saadparwaiz1/cmp_luasnip',
        dependencies = "LuaSnip",
    },
    {
        'hrsh7th/cmp-nvim-lua',
        dependencies = "cmp_luasnip",
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = "cmp-nvim-lua",
    },
    {
        'hrsh7th/cmp-cmdline',
        dependencies = "cmp-nvim-lua",
    },
    {
        'hrsh7th/cmp-buffer',
        dependencies = "cmp-nvim-lsp",
    },
    {
        'hrsh7th/cmp-path',
        dependencies = "cmp-buffer",
    },
    {
        'lukas-reineke/cmp-under-comparator',
        dependencies = "cmp_luasnip",
    },

    -- Mason DAP to quickly install and custom config for debugger
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("user.plugins.dapmason")
        end,
    },

    -- DAP UI to supply UI for debugging
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("user.plugins.dapui")
        end
    },

    -- DAP for debugger
    {
        'mfussenegger/nvim-dap',
        config = function(_, _)
            -- require("core.utils").load_mappings("dap")
            -- INFO: The config for debugger is able to set manually
            -- If you use this config, you will disable mason DAP to avoid duplicate debugger settings
            -- require("user.plugins.dap_config.c")
        end
    },

    -- Store breakpoints after terminating debug progress
    {
        'Weissle/persistent-breakpoints.nvim',
        event = "VeryLazy",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("user.plugins.persistent")
        end
    },

    -- Virtul text for debbuging
    {
        'theHamsta/nvim-dap-virtual-text',
        event = "VeryLazy",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("user.plugins.dapvirtualtext")
        end
    },

    -- TODO: Nvim IDE layout
    -- {
    --     'ldelossa/nvim-ide',
    --     event = "VeryLazy",
    --     config = function ()
    --         require("user.plugins.ide")
    --     end
    -- },

    {
        "nvim-neorg/neorg",
        -- build = ":Neorg sync-parsers", -- It should be enable after frist installation.
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
    },
}
