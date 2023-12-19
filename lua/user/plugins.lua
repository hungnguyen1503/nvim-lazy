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

    -- File explorer-- File explorer
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     tag = 'nightly',
    --     -- dependencies = {
    --     --     "stevearc/dressing.nvim"
    --     -- },
    --     config = function()
    --         require("user.plugins.nvimtree")
    --     end,
    --     cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    -- },

    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = "Neotree",
        config = function()
            require("user.plugins.neotree")
        end
    },

    -- Window picker
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        cmd = "Neotree",
        version = '2.*',
        config = function()
            require("user.plugins.window-picker")
        end,
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

    -- Improve yank
    {
        'gbprod/yanky.nvim',
        event = "VeryLazy",
        config = function()
            require("user.plugins.yanky")
        end
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

    -- Auto pair
    {
        'windwp/nvim-autopairs',
        config = function()
            require("user.plugins.autopairs")
        end,
        event = { "InsertEnter" },
    },

    -- Improve auto pair
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

    -- Duplicate
    {
        "hinell/duplicate.nvim",
        event = "VeryLazy",
        setup = function()
            vim.g["duplicate-nvim-config"] = {
                visual = {
                    selectAfter = true, -- true to select duplicated text
                    block = true -- true to enable block-wise duplication
                }
            }
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
            -- Dap
            'nvim-telescope/telescope-dap.nvim'
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
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
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
    -- {
    --     'kqito/vim-easy-replace',
    --     event = "VeryLazy",
    --     config = function()
    --         require("user.plugins.replace")
    --     end
    -- },

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
        commit = "e1e670a86274d5cb681e475d4891ea1afe605ced",
        event = 'VeryLazy',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    -- Bracket rainbow color
    {
        'HiPhish/rainbow-delimiters.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require("user.plugins.rainbow")
        end
    },

    -- Auto save the project
    {
        'okuuva/auto-save.nvim',
        event = "VeryLazy",
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
        event  = {
            "BufRead",
            "VeryLazy"
        },
        config = function()
            require("user.plugins.blankline")
        end
    },

    {
        'vidocqh/auto-indent.nvim',
        event = { "VeryLazy" },
        config = function()
            require("user.plugins.autoindent")
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
        'nvimdev/lspsaga.nvim',
        event = 'BufRead',
        config = function()
            require("user.plugins.lspsaga")
        end,
        dependencies = {
            'anuvyklack/windows.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Lsp outline
    {
        "hedyhli/outline.nvim",
        event = "VeryLazy",
        cmd = { "Outline", "OutlineOpen" },
        config = function ()
            require("user.plugins.outline")
        end
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

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require("user.plugins.lspsignature")
        end
    },

    -- Mason DAP to quickly install and custom config for debugger
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = "VeryLazy",
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
        event = "VeryLazy",
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
        "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
            enabled = true,
        },
        build = function()
            require("gitlab.server").build(true)
        end, -- Builds the Go binary
        -- dir = vim.fn.stdpath("data") .. "/lazy/gitlab",
        config = function()
            require("user.plugins.gitlab")
        end,
    },

    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers", -- It should be enable after frist installation.
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            load = {
                ["core.defaults"]              = {}, -- Loads default behaviour.
                ["core.mode"]                  = {}, -- Loads default behaviour.
                ["core.concealer"]             = {
                    config = {
                        folds = false
                    }
                }, -- Adds pretty icons to your documents.
                ["core.integrations.nvim-cmp"] = {},
                ["core.completion"]            = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                -- INFO: This configuration will be added in nvim > 0.1.x
                -- ["core.ui.calendar"]           = {},
                ['core.summary']               = {},
                ["core.syntax"]                = {}, -- Handles interaction for syntax files for code blocks.
                ["core.dirman"]                = { -- Manages Neorg workspaces.
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            fsp = "D://FSP"
                        },
                    },
                },
            },
        },
    },

    {
        "andrewferrier/debugprint.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            create_keymaps = true
        },
    }
}
