local M = {}
M.general = {
    i = {
        -- Quick normal map
        -- ["jk"] = { "<ESC>", "Escape vim" },
        -- ["kj"] = { "<ESC>", "Escape vim" },
        -- Wrap text
        ["<A-r>"] = { "<C-o><cmd>set wrap!<CR>", opts = { silent = true }, "Enable wrap text" },
        -- Paste
        ["<C-v>"] = { "<C-R>*", "Set paste as Win OS" },
        -- Delete
        ["<C-BS>"] = { "<C-o>b<C-o>dw", opts = { silent = true }, "Delete by Ctrl Backspace" },
        ["<C-Del>"] = { "<C-o>dw", opts = { silent = true }, "Delete by Ctrl Backspace" },
        ["<C-s>"] = {
            "<ESC>:w<CR>",
            "Save file in insert mode",
            opts = { silent = true },
        },
        -- go to  beginning and end
        ["<C-h>"] = { "<ESC>^i", "Beginning of line" },
        ["<C-l>"] = { "<End>", "End of line" },
        -- move word
        ["<C-w>"] = { "<C-\\><C-O>w", opts = { silent = true }, "Move words forward" },
        ["<C-b>"] = { "<C-\\><C-O>b", opts = { silent = true }, "Move words backward" },
        ["<C-e>"] = { "<C-\\><C-O>e<C-O><Right>", opts = { silent = true }, "Forword to end of word" },
        ["<C-z>"] = { "<C-g>u<Esc>[s1z=`]a<C-g>u", opts = { silent = true }, "Correct ltest misspelled word" },
        -- New line
        -- TODO: Add insert new line abow cursor
        ["<C-o>"] = { "<C-\\><C-O>o", opts = { silent = true }, "Insert new line below cursor" },
        -- navigate within insert mode
        ["<A-h>"] = { "<Left>", "Move left" },
        ["<A-l>"] = { "<Right>", "Move right" },
        ["<A-j>"] = { "<Down>", "Move down" },
        ["<A-k>"] = { "<Up>", "Move up" },
        -- line relative numbers
        ["<F12>"] = { "<C-o><cmd>set relativenumber!<CR>", "Toggle line relative number" },
    },
    n = {
        ["<ESC>"]      = { "<cmd> noh <CR>", "No highlight" },
        -- Change argument wrapping
        ["<leader>ar"] = { "<cmd>ArgWrap<CR>", "Change argument wrapping" },
        -- Set cursor move begin and end line
        ["<S-h>"]      = { "^", "Cursor left" },
        ["<S-l>"]      = { "$", "Cursor right" },
        -- switch between windows
        ["<C-h>"]      = { "<C-w>h", "Window left" },
        ["<C-l>"]      = { "<C-w>l", "Window right" },
        ["<space>h"]   = { "<C-w>h", "Window left" },
        ["<space>l"]   = { "<C-w>l", "Window right" },
        ["<space>j"]   = { "<C-w>j", "Window down" },
        ["<space>k"]   = { "<C-w>k", "Window up" },
        -- Copy all
        ["<C-c>"]      = { "<cmd> %y+ <CR>", "Copy whole file" },
        -- line relative numbers
        ["<F12>"]      = { "<cmd>set relativenumber!<CR>", "toggle line relative number" },
        -- Wrap text
        ["<A-r>"]      = { "<cmd>set wrap!<CR>", "Enable wrap text" },
        -- Delete
        ["<C-BS>"]     = { "bdw", "Delete by Ctrl Backspace" },
        -- Insert blank line
        ["<space>o"]   = { "o<ESC>", "Insert blow blank line" },
        ["<space>O"]   = { "O<ESC>", "Insert abow blank line" },
        -- Manage to split window
        ["<leader>co"] = { "<C-W>o<CR>", "Close all split window" },
        ["<leader>vs"] = { "<cmd>vs<CR>", "Veritical split window" },
        ["<leader>hs"] = { "<cmd>split<CR>", "Horizontal split window" },
        ["<leader>cs"] = { "<cmd>close<CR>", "Horizontal split window" },
        -- Unhightlight after search
        ["n"]          = { "<cmd>set hlsearch<CR>n", "Next search" },
        ["N"]          = { "<cmd>set hlsearch<CR>N", "Previou search" },
        ["<C-s>"]      = {
            "<ESC>:w<CR>",
            "Save file in insert mode",
            opts = { silent = true },
        },
        ["<leader>ss"]  = {
            "<ESC>:w<CR>:source%<CR>",
            "Save file and source file in normal mode",
            opts = { silent = true },
        },

        ["<C-z>"] = { "[s1z=", opts = { silent = true }, "Correct ltest misspelled word" },
        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["j"]          = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
        ["k"]          = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
        ["<Up>"]       = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
        ["<Down>"]     = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

        ["\\"]         = { "%", "Goto bracket pairs" },

        -- Cheat sheet
        ["<leader>ch"] = { "<cmd>NvCheatsheet<CR>", "Cheat Sheet" },
    },
    v = {
        ["//"]       = { "\"fy/\\V<C-R>f<CR>", "Search a visual word", opts = { silent = true } },
        ["<"]        = { "<gv", "easier moving code block right" },
        [">"]        = { ">gv", "easier moving code block left" },
        ["<Up>"]     = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
        ["<Down>"]   = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
        -- Format range
        ["<space>f"] = { "<cmd>lua require'lsp-range-format'.format()<CR>", "format range" },
        -- ["y"]        = { "mcy`c", "copy not move cursor" },
        ["\\"]       = { "%", "Goto bracket pairs" },
    },
    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
        -- Unhightlight after search
        ["n"] = { "<cmd>set hlsearch<CR>n", "Next search" },
        ["N"] = { "<cmd>set hlsearch<CR>N", "Previou search" },
        ["<C-BS>"] = { "bdw", "Delete by Ctrl Backspace" },
        -- Set cursor move begin and end line
        ["<S-h>"] = { "^", "Cursor left" },
        ["<S-l>"] = { "$", "Cursor right" },
    },
    o = {
        ["<S-h>"] = { "^", "Cursor left" },
        ["<S-l>"] = { "$", "Cursor right" },
        ["\\"] = { "%", "Goto bracket pairs" },
    },
    c = {
        ["<C-v>"] = { "<C-R>*", "Set paste as Win OS in command line" },
    },
}

M.lazygit = {
    n = {
        ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Lazygit" },
    }
}

M.bufferline = {
    -- plugin = true,
    n = {
        -- Move to previous/next
        ["<A-.>"]         = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
        ["<A-,>"]         = { "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
        -- Go to buffer in position
        ["<A-1>"]         = { "<cmd>BufferLineGoToBuffer 1<CR>", "Goto buffer 1" },
        ["<A-2>"]         = { "<cmd>BufferLineGoToBuffer 2<CR>", "Goto buffer 2" },
        ["<A-3>"]         = { "<cmd>BufferLineGoToBuffer 3<CR>", "Goto buffer 3" },
        ["<A-4>"]         = { "<cmd>BufferLineGoToBuffer 4<CR>", "Goto buffer 4" },
        ["<A-5>"]         = { "<cmd>BufferLineGoToBuffer 5<CR>", "Goto buffer 5" },
        ["<A-6>"]         = { "<cmd>BufferLineGoToBuffer 6<CR>", "Goto buffer 6" },
        ["<A-7>"]         = { "<cmd>BufferLineGoToBuffer 7<CR>", "Goto buffer 7" },
        ["<A-8>"]         = { "<cmd>BufferLineGoToBuffer 8<CR>", "Goto buffer 8" },
        ["<A-9>"]         = { "<cmd>BufferLineGoToBuffer 9<CR>", "Goto buffer 9" },
        -- Re-order to previous/next
        ["<space>."]      = { "<cmd>BufferLineMoveNext<CR>", "Next Buffer" },
        ["<space>,"]      = { "<cmd>BufferLineMovePrev<CR>", "Previous Buffer" },
        -- Pin/unpin buffer
        ["<space>p"]      = { "<cmd>BufferLineTogglePin<CR>", "Pin/Unpin buffer" },
        -- Close buffer
        ["<space><Tab>"]  = {
            function(bufnum)
                require('bufdelete').bufdelete(bufnum, true)
            end,
            "Close current buffer"
        },
        ["<space>a<Tab>"] = { "<cmd>BufferLineCloseOthers<CR>", "Close all but keep current or pinned" },
        -- NOTE: It should be changed another keymap
        -- ["<space><Tab>"] = { "<cmd>BufferLineCloseLeft<CR>", "Close all but keep current or pinned" },
        -- ["<space><Tab>"] = { "<cmd>BufferLineCloseRight<CR>", "Close all but keep current or pinned" },
    },
}

M.move = {
    n = {
        ["<A-j>"] = { ":MoveLine(1)<CR>", "Move line down", opts = { silent = true } },
        ["<A-k>"] = { ":MoveLine(-1)<CR>", "Move line up", opts = { silent = true } },
        ["<A-h>"] = { ":MoveHChar(-1)<CR>", "Move line left", opts = { silent = true } },
        ["<A-l>"] = { ":MoveHChar(1)<CR>", "Move line right", opts = { silent = true } },
    },
    v = {
        ["<A-j>"] = { ":MoveBlock(1)<CR>", "Move block line down", opts = { silent = true } },
        ["<A-k>"] = { ":MoveBlock(-1)<CR>", "Move blockline up", opts = { silent = true } },
        ["<A-h>"] = { ":MoveHBlock(-1)<CR>", "Move blockline,left", opts = { silent = true } },
        ["<A-l>"] = { ":MoveHBlock(1)<CR>", "Move blockline right", opts = { silent = true } },
    }
}

M.fontsize = {
    n = {
        ['<leader>if'] = { "<cmd>FontSizeUp 0.5<CR>", "Increase font 0.5 size" },
        ['<leader>df'] = { "<cmd>FontSizeDown 0.5<CR>", "Decrease font 0.5 size" },
    },
    i = {
        ['<leader>if'] = { "<cmd>FontSizeUp 0.5<CR>", "Increase font 0.5 size" },
        ['<leader>df'] = { "<cmd>FontSizeDown 0.5<CR>", "Decrease font 0.5 size" },
    }
}

M.trouble = {
    n = {
        ['<leader>tb'] = {
            "<cmd>Trouble diagnostics toggle<CR>",
            "Toggle diagnostics trouble"
        },
        ['<leader>td'] = {
            "<cmd>Trouble todo toggle<CR>",
            "Toggle diagnostics trouble"
        }
    }
}

M.neotree = {
    n = {
        ["<F4>"] = {"<cmd>Neotree toggle<cr>","Toggle Neotree"},
    },
}

M.lspconfig = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "Lsp declaration",
        },
        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "Lsp definition",
        },
        -- ["K"] = {
        --     function()
        --         vim.lsp.buf.hover()
        --     end,
        --     "lsp hover",
        -- },

        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "Lsp implementation",
        },
        -- ["<leader>ls"] = {
        --     function()
        --         vim.lsp.buf.signature_help()
        --     end,
        --     "Lsp signature_help",
        -- },
        ["<leader>ls"] = {
            function()
                require('lsp_signature').toggle_float_win()
            end,
            "Lsp signature_help",
        },
        ["gt"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "Lsp definition type",
        },
        -- ["<leader>ra"] = {
        --     function()
        --         vim.lsp.buf.rename()
        --     end,
        --     "Lsp rename",
        -- },
        -- ["<leader>ca"] = {
        --   function()
        --     vim.lsp.buf.code_action()
        --   end,
        --   "lsp code_action",
        -- },

        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "Lsp references",
        },
        ["<leader>f"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "Floating diagnostic",
        },
        ["[d"] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "Goto prev",
        },
        ["d]"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "Goto_next",
        },
        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Diagnostic setloclist",
        },
        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "Lsp formatting",
        },
        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "Add workspace folder",
        },
        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "Remove workspace folder",
        },
        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List workspace folders",
        },
    },
    x = {
        ["<space>f"] = {
            ":lua require'lsp-range-format'.format()<ESC>",
            "Lsp formatting",
        },
    }
}

M.lspsaga = {
    n = {
        ["gpd"]        = { "<cmd>Lspsaga peek_definition<CR>", "Goto peek definition" },
        ["gf"]         = { "<cmd>Lspsaga finder<CR>", "Lsp finder" },
        ["K"]          = { "<cmd>Lspsaga hover_doc<CR>", "Hover doc" },
        ["<leader>go"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostic" },
        ["<leader>gc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostic" },
        ["<leader>gb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show buffer diagnostic" },
        ["<leader>gj"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostic jump next" },
        ["<leader>gk"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostic jump previous" },
        ["<leader>ra"] = { "<cmd>Lspsaga rename<CR>", "Lsp rename" },
        ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Lsp code action" },
        -- ["<leader>o"]  = { "<cmd>Lspsaga outline<CR>", "Lspsaga outline" },
    },
    v = {
        ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Lsp code action" },
        ["<leader>ra"] = { "<cmd>Lspsaga rename<CR>", "Lsp rename" },
    }
}

M.outline = {
    n = {
        ["<leader>o"] = { "<cmd>Outline<CR>", "Outline" }
    }
}

M.telescope = {
    n = {
        -- find
        ["<leader>ff"]     = { "<cmd> Telescope find_files <CR>", "Find files" },
        ["<leader>fa"]     = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all files" },
        ["<leader>fw"]     = { "<cmd> Telescope live_grep <CR>", "Find live grep" },
        -- ["<leader>ft"]     = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>fo"]     = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
        ["<leader>fk"]     = { "<cmd> Telescope keymaps <CR>", "Find key mappings" },
        -- ["<leader>fp"]     = { "<cmd> Telescope project <CR>", "Find projects" },
        ["<leader>fp"]     = { "<cmd> Telescope neovim-project discover <CR>", "Find project" },
        ["<leader>fb"]     = { "<cmd> Telescope file_browser <CR>", "Find browser" },
        ["<leader>fh"]     = { "<cmd> Telescope highlights <CR>", "Find highlights" },
        ["<leader>f<Tab>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        -- git
        -- ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        -- ["<leader>st"] = { "<cmd> Telescope git_status <CR>", "git status" },

        -- Yank history
        -- ["<leader>y"]      = { "<cmd> Telescope yank_history <CR>", "Find the yank history" },

        -- Noice
        ["<leader>n"]      = { "<cmd> Telescope noice <CR>", "Find the noice log" },
        ["<leader>m"]      = { "<cmd> Telescope marks <CR>", "Find the marks" },

        -- pick a hidden term
        ["<leader>pt"]     = { "<cmd> Telescope terms <CR>", "Find and pick hidden term" },

        -- theme switcher
        ["<leader>th"]     = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

        -- command
        ["<leader>cm"]     = {
            function()
                require('telescope.builtin').commands(require('telescope.themes').get_dropdown())
            end,
        }
    },
}

M.jabs = {
    n = {
        ["<leader>b"] = { "<cmd>JABSOpen<CR>", "Quick open buffer with review" },
    }
}

M.gitsigns = {
    n = {
        -- Navigation through hunks
        ["]h"] = {
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to next hunk",
            opts = { expr = true },
        },
        ["[h"] = {
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to prev hunk",
            opts = { expr = true },
        },
        -- Actions
        ["<leader>rh"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },
        ["<leader>ph"] = {
            function()
                require("gitsigns").preview_hunk()
            end,
            "Preview hunk",
        },
        ["<leader>gb"] = {
            function()
                package.loaded.gitsigns.blame_line()
            end,
            "Blame line",
        },
        ["<leader>gd"] = {
            function()
                require("gitsigns").toggle_deleted()
            end,
            "Toggle deleted",
        },
    },
}

M.floaterm = {
    n = {
        ["<leader>to"] = { "<cmd>FloatermNew bash<CR>", opts = { silent = true }, "Open new terminal" },
        ["<leader>tk"] = { "<cmd>FloatermKill<CR>:floatermprev<cr>", opts = { silent = true }, "Kill current terminal" },
        ["<leader>tn"] = { "<cmd>FloatermNext<CR>", opts = { silent = true }, "Next terminal" },
        ["<leader>tp"] = { "<cmd>FloatermPrev<CR>", opts = { silent = true }, "Previous terminal" },
        ["<leader>tt"] = { "<cmd>FloatermToggle<CR>", opts = { silent = true }, "Toggle terminal" },
        ["<leader>ts"] = { "<cmd>FloatermShow<CR>", opts = { silent = true }, "Show terminal" },
    },
    t = {
        ["<leader>to"] = { "<C-\\><C-n><cmd>FloatermNew bash<CR>", opts = { silent = true }, "Open new terminal" },
        ["<leader>tk"] = { "<C-\\><C-n><cmd>FloatermKill<CR>:FloatermPrev<cr>", opts = { silent = true }, "Kill current terminal" },
        ["<leader>tn"] = { "<C-\\><C-n><cmd>FloatermNext<CR>", opts = { silent = true }, "Next terminal" },
        ["<leader>tp"] = { "<C-\\><C-n><cmd>FloatermPrev<CR>", opts = { silent = true }, "Previous terminal" },
        ["<leader>tt"] = { "<C-\\><C-n><cmd>FloatermToggle<CR>", opts = { silent = true }, "Toggle terminal" },
        ["<leader>ts"] = { "<C-\\><C-n><cmd>FloatermShow<CR>", opts = { silent = true }, "Show terminal" },
        ["<C-v>"]      = { "<C-\\><C-n>pi", "Paste in terminal", opts = { silent = true }, },
        ["<C-BS>"]     = { "<C-\\><C-n>bdw", opts = { silent = true }, "Delete word in terminal" },
        ["<C-q>"]      = { "<C-\\><C-n>:FloatermToggle<CR>", opts = { silent = true }, "Quit terminal" },
    },
}

M.align = {
    n = {
        ["<leader>aw"] = {
            function()
                local a = require 'align'
                a.operator(
                    a.align_to_string,
                    { is_pattern = false, reverse = true, preview = true }
                )
            end,
            "Aligns to 1 character, looking left and with preivews"
        }
    },
    x = {
        ["<leader>aa"] = {
            function()
                require 'align'.align_to_char({
                    lenth = 1
                })
            end,
            "Aligns to 1 character, looking left"
        },
        ["<leader>as"] = {
            function()
                require 'align'.align_to_char({
                    lenth = 2,
                    preview = true
                })
            end,
            "Aligns to 2 characters, looking left and with previews"
        },
        ["<leader>aw"] = {
            function()
                require 'align'.align_to_string({
                    regex = false,
                    preview = true
                })
            end,
            "Aligns to a string, looking left and with previews"
        },
        ["<leader>ar"] = {
            function()
                require 'align'.align_to_string({
                    regex = true,
                    preview = true
                })
            end,
            "Aligns to a Lua pattern, looking left and with previews"
        },
    }
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection
M.hop = {
    n = {
        ["f"] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end,
            "Hop move forward"
        },
        ["F"] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end,
            "Hop move backward"
        },
        ['t'] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move forward before cursor"
        },
        ['T'] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move backward before cursor"
        }
    },
    x = {
        ["f"] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end,
            "Hop move forward"
        },
        ["F"] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end,
            "Hop move backward"
        },
        ['t'] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move forward before cursor"
        },
        ['T'] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move backward before cursor"
        }
    },
    o = {
        ["f"] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end,
            "Hop move forward"
        },
        ["F"] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end,
            "Hop move backward"
        },
        ['t'] = {
            function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move forward before cursor"
        },
        ['T'] = {
            function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            "Hop move backward before cursor"
        }
    }
}

M.nerdy = {
    n = {
        ["<leader>ip"] = { "<cmd>Nerdy<CR>", "Icon picker in normal mode" }
    }
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
M.treesitter = {
    n = {
        [";"] = { ts_repeat_move.repeat_last_move_next, "Goes forward" },
        ["<A-;>"] = { ts_repeat_move.repeat_last_move_previous, "Goes previous" },
    },
    x = {
        [";"] = { ts_repeat_move.repeat_last_move_next, "Goes forward" },
        ["<A-;>"] = { ts_repeat_move.repeat_last_move_previous, "Goes previous" },
    },
    v = {
        [";"] = { ts_repeat_move.repeat_last_move_next, "Goes forward" },
        ["<A-;>"] = { ts_repeat_move.repeat_last_move_previous, "Goes previous" },
    },
    o = {
        [";"] = { ts_repeat_move.repeat_last_move_next, "Goes forward" },
        ["<A-;>"] = { ts_repeat_move.repeat_last_move_previous, "Goes previous" },
    },
}

M.spider = {
    n = {
        ["w"] = {
            function()
                require("spider").motion("w")
            end,
            "Spider w"
        },
        ["e"] = {
            function()
                require("spider").motion("e")
            end,
            "Spider e"
        },
        ["b"] = {
            function()
                require("spider").motion("b")
            end,
            "Spider b"
        },
        ["ge"] = {
            function()
                require("spider").motion("ge")
            end,
            "Spider ge"
        },
        ["cw"] = { "c<cmd>lua require('spider').motion('e')<CR>", "Spider ge" }
    },
    o = {
        ["w"] = {
            function()
                require("spider").motion("w")
            end,
            "Spider w"
        },
        ["e"] = {
            function()
                require("spider").motion("e")
            end,
            "Spider e"
        },
        ["b"] = {
            function()
                require("spider").motion("b")
            end,
            "Spider b"
        },
        ["ge"] = {
            function()
                require("spider").motion("ge")
            end,
            "Spider ge"
        },
        ["cw"] = { "c<cmd>lua require('spider').motion('e')<CR>", "Spider ge" }
    },
    x = {
        ["w"] = {
            function()
                require("spider").motion("w")
            end,
            "Spider w"
        },
        ["e"] = {
            function()
                require("spider").motion("e")
            end,
            "Spider e"
        },
        ["b"] = {
            function()
                require("spider").motion("b")
            end,
            "Spider b"
        },
        ["ge"] = {
            function()
                require("spider").motion("ge")
            end,
            "Spider ge"
        },
        ["ciw"] = { "c<cmd>lua require('spider').motion('e')<CR>", "Spider ge" }
    }
}

M.replace = {
    n = {
        ["<leader>rw"] = { "<cmd>EasyReplaceWord<CR>", "Replace word" },
        ["<leader>rc"] = { "<cmd>EasyReplaceCword<CR>", "Replace cursor word" },
    },
    x = {
        ["<leader>rw"] = { "<cmd>EasyReplaceWordInVisual<CR>", "Replace word" },
        ["<leader>rc"] = { "<cmd>EasyReplaceCwordInVisual<CR>", "Replace cursor word" },
    }
}

M.dap = {
    n = {
        -- ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Add breakpoint at line" },
        -- ["<leader>dr"]  = { "<cmd>DapContinue<CR>", "Start or continue the debugger" },
        ["<F5>"]        = { "<cmd>DapStepInto<CR>", "Step into" },
        ["<F6>"]        = { "<cmd>DapStepOver<CR>", "Step Over" },
        ["<F7>"]        = { "<cmd>DapStepOut<CR>", "Step Out" },
        ["<F8>"]        = { "<cmd>DapContinue<CR>", "Start or continue the debugger" },
        ["<C-F2>"]      = { "<cmd>DapTerminate<CR>", "Terminate debugger" },
        ["<F3>"]        = {
            function()
                require("dapui").eval()
            end,
            "Start or continue the debugger"
        },
        ["<leader>db"]  = {
            function()
                require('persistent-breakpoints.api').toggle_breakpoint()
            end,
            "Add breakpoint at line"
        },
        -- -- BUG: This feature should be disabled because of being conflicted to use icon DAP debugg
        -- -- INFO: Using mouse to toggle breakpoint
        -- -- ["<2-LeftMouse>"] = {
        -- --     function()
        -- --         require('persistent-breakpoints.api').toggle_breakpoint()
        -- --     end,
        -- --     "Add breakpoint at line by double click"
        -- -- },
        ["<leader>dcb"] = {
            function()
                require('persistent-breakpoints.api').set_conditional_breakpoint(vim.fn.input(' CONDITION    '))
            end,
            "Condition breakpoint"
        },
        ["<leader>ddb"] = {
            function()
                require('persistent-breakpoints.api').clear_all_breakpoints()
            end,
            "Clear all breakpoints"
        },
    }
}

M.flash = {
    n = {
        ["<leader>j"] = {
            function()
                require("flash").jump()
            end,
            "Flash jump"
        },
        ["<leader>ft"] = {
            function()
                require("flash").treesitter()
            end,
            "Flash treesitter"
        },
    },
    o = {
        ["<leader>j"] = {
            function()
                require("flash").jump()
            end,
            "Flash jump"
        },
        ["<leader>ft"] = {
            function()
                require("flash").treesitter()
            end,
            "Flash treesitter"
        },
    },

    x = {
        ["<leader>j"] = {
            function()
                require("flash").jump()
            end,
            "Flash jump"
        },
        ["<leader>ft"] = {
            function()
                require("flash").treesitter()
            end,
            "Flash treesitter"
        },
    }
}

M.duplicate = {
    n = {
        ["<leader>dk"] = { "<cmd>LineDuplicate -1<CR>", "Line: duplicate up" },
        ["<leader>dj"] = { "<cmd>LineDuplicate +1<CR>", "Line: duplicate down" },
    },
    v = {
        ["<leader>dk"] = { "<cmd>VisualDuplicate  -1<CR>", "Line: duplicate up" },
        ["<leader>dj"] = { "<cmd>VisualDuplicate +1<CR>", "Line: duplicate down" },
    }
}

M.dropbar = {
    n = {
        ["<leader>ww"] = {
            function()
                require("dropbar.api").pick()
            end,
            "pick winbar element"
        },
    }
}

M.diffview = {
    n = {
        ["<leader>do"] = { "<cmd> DiffviewOpen <CR>", "Diff view open" },
        ["<leader>dc"] = { "<cmd> DiffviewClose <CR>", "Diff view close" },
        ["<leader>dh"] = { "<cmd> DiffviewFileHistory <CR>", "Open history" },
        ["<leader>df"] = { "<cmd> DiffviewFileHistory %<CR>", "Current History" },
    }
}

M.neoscroll = {
    n = {
        ["<C-u>"] = {
            function ()
                require('neoscroll').ctrl_u({timeout = 350; easing = 'cubic'})
            end,
            "Scroll Up with U"
        },
        ["<C-d>"] = {
            function()
                require('neoscroll').ctrl_d({ timeout = 350, easing = 'cubic' })
            end,
            "Scroll Down with D"
        },
        ["<C-b>"] = {
            function()
                require('neoscroll').ctrl_b({ timeout = 400, easing = 'cubic' })
            end,
            "Scroll Backward with B"
        },
        ["<C-f>"] = {
            function()
                require('neoscroll').ctrl_f({ timeout = 400, easing = 'cubic' })
            end,
            "Scroll Forward with F"
        },
        ["<C-k>"] = {
            function()
                require('neoscroll').scroll( -0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Up with K"
        },
        ["<C-j>"] = {
            function()
                require('neoscroll').scroll( 0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Down with J"
        },
        ["<ScrollWheelUp>"] = {
            function()
                require('neoscroll').scroll( -0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Up with WheelUp"
        },
        ["<ScrollWheelDown>"] = {
            function()
                require('neoscroll').scroll( 0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Down with WheelDown"
        }
    },
    x = {
        ["<C-u>"] = {
            function ()
                require('neoscroll').ctrl_u({timeout = 350; easing = 'cubic'})
            end,
            "Scroll Up with U"
        },
        ["<C-d>"] = {
            function()
                require('neoscroll').ctrl_d({ timeout = 350, easing = 'cubic' })
            end,
            "Scroll Down with D"
        },
        ["<C-b>"] = {
            function()
                require('neoscroll').ctrl_b({ timeout = 400, easing = 'cubic' })
            end,
            "Scroll Backward with B"
        },
        ["<C-f>"] = {
            function()
                require('neoscroll').ctrl_f({ timeout = 400, easing = 'cubic' })
            end,
            "Scroll Forward with F"
        },
        ["<C-k>"] = {
            function()
                require('neoscroll').scroll( -0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Up with K"
        },
        ["<C-j>"] = {
            function()
                require('neoscroll').scroll( 0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Down with J"
        },
        ["<ScrollWheelUp>"] = {
            function()
                require('neoscroll').scroll( -0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Up with WheelUp"
        },
        ["<ScrollWheelDown>"] = {
            function()
                require('neoscroll').scroll( 0.25, { move_cursor = true, duration = 200, easing = 'sine' } )
            end,
            "Scroll Down with WheelDown"
        }
    }
}

M.GrugFar = {
    n = {
        ["<leader>fs"] = {
            function()
                require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
            end,
            "Search and Replace Current Word in Normal mode"
        },
        ["<leader>sc"] = {
            function()
                require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>"), filesFilter = '*.{c, h, cpp}' } })
            end,
            "Search and Replace Word in Normal mode"
        },
        ["<leader>sl"] = {
            function()
                require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>"), filesFilter = '*.{lua}' } })
            end,
            "Search and Replace Word in Normal mode"
        },
    },

    x = {
        ["<leader>fs"] = {
            function ()
                require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
            end,
            "Search and Replace Current Word in Visual mode"
        },
    },
}

M.yankbank = {
    n = {
        ["<leader>y"] = { "<cmd>YankBank<CR>", "Quick open buffer with review" },
    }
}

return M
