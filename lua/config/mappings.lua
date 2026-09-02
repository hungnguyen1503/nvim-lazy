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
        ["<C-j>"] = {
            function()
                require("neoscroll").scroll(0.25, { move_cursor = true, duration = 200, easing = "sine" })
            end,
            "Scroll down",
        },
        ["<C-k>"] = {
            function()
                require("neoscroll").scroll(-0.25, { move_cursor = true, duration = 200, easing = "sine" })
            end,
            "Scroll up",
        },
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
        ["<leader>ss"] = {
            "<ESC>:w<CR>:source%<CR>",
            "Save file and source file in normal mode",
            opts = { silent = true },
        },

        ["<C-z>"]      = { "[s1z=", opts = { silent = true }, "Correct ltest misspelled word" },
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
        ["<space>f"] = { "gq", "Format selection (LSP range format)" },
        ["\\"]       = { "%", "Goto bracket pairs" },

    },
    x = {
        ["<C-j>"] = {
            function()
                require("neoscroll").scroll(0.25, { move_cursor = true, duration = 200, easing = "sine" })
            end,
            "Scroll down",
        },
        ["<C-k>"] = {
            function()
                require("neoscroll").scroll(-0.25, { move_cursor = true, duration = 200, easing = "sine" })
            end,
            "Scroll up",
        },
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
            function()
                vim.api.nvim_buf_delete(0, { force = true })
            end,
            "Close current buffer"
        },
        ["<space>a<Tab>"] = { "<cmd>BufferLineCloseOthers<CR>", "Close all" },
        ["<space>l<Tab>"] = { "<cmd>BufferLineCloseLeft<CR>", "Close all tab in the left side" },
        ["<space>r<Tab>"] = { "<cmd>BufferLineCloseRight<CR>", "Close all tab in the right side" },
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
        ["<F4>"] = { "<cmd>Neotree toggle reveal<cr>", "Toggle Neotree" },
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
                vim.lsp.buf.signature_help()
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
        ["<space>f"] = { "gq", "Lsp formatting" },
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

M.fzf = {
    n = {
        ["<leader>ff"] = {
            function()
                -- VS Code-style list-only picker: prompt on top (fzf --layout=reverse),
                -- no preview pane or preview process (previewer=false + preview.hidden).
                require("fzf-lua").files({
                    fd_opts = "--type f --hidden --follow --no-ignore",
                    previewer = false,
                    winopts = { preview = { hidden = true } },
                })
            end,
            "Find files",
        },
        ["<leader>fg"] = { function() require("fzf-lua").live_grep() end, "Find live grep" },
        ["<leader>fo"] = { function() require("fzf-lua").oldfiles() end, "Find old files" },
        ["<leader>fk"] = { function() require("fzf-lua").keymaps() end, "Find key mappings" },
        ["<leader>fp"] = { "<cmd>NeovimProjectDiscover<CR>", "Find project" },
        ["<leader>fb"] = { function() require("config.pickers").files() end, "Browse files" },
        ["<leader>fh"] = { function() require("fzf-lua").highlights() end, "Find highlights" },
        ["<leader>f<Tab>"] = { function() require("fzf-lua").buffers() end, "Find buffers" },
        ["<leader>/"] = { function() require("fzf-lua").blines() end, "Find current-buffer text" },
        ["<leader>n"] = { "<cmd>Noice history<CR>", "Show Noice history" },
        ["<leader>m"] = { function() require("fzf-lua").marks() end, "Find marks" },
        ["<leader>pt"] = { "<cmd>FloatermNext<CR>", "Next terminal" },
        ["<leader>th"] = { function() require("fzf-lua").colorschemes() end, "Choose colorscheme" },
        ["<leader>cm"] = { function() require("fzf-lua").commands() end, "Find commands" },
    },
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
                    require("gitsigns").nav_hunk("next")
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
                    require("gitsigns").nav_hunk("prev")
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
        ["<leader>to"] = { "<cmd>FloatermNew<CR>", opts = { silent = true }, "Open new terminal" },
        ["<leader>tk"] = { "<cmd>FloatermKill<CR><cmd>FloatermPrev<CR>", opts = { silent = true }, "Kill current terminal" },
        ["<leader>tn"] = { "<cmd>FloatermNext<CR>", opts = { silent = true }, "Next terminal" },
        ["<leader>tp"] = { "<cmd>FloatermPrev<CR>", opts = { silent = true }, "Previous terminal" },
        ["<leader>tt"] = { "<cmd>FloatermToggle<CR>", opts = { silent = true }, "Toggle terminal" },
        ["<leader>tr"] = {
            "<cmd>FloatermNew --width=0.4 --height=0.9 --position=right --wintype=float<CR>",
            opts = { silent = true },
            "Toggle terminal"
        },
        ["<leader>tf"] = {
            "<cmd>FloatermNew --width=0.9 --height=0.9 --position=center --wintype=float<CR>",
            opts = { silent = true },
            "Toggle terminal"
        },
        ["<leader>ts"] = { "<cmd>FloatermShow<CR>", opts = { silent = true }, "Show terminal" },
    },
    t = {
        ["<leader>tk"]    = { "<cmd>FloatermKill<CR><cmd>FloatermPrev<CR>", opts = { silent = true }, "Kill current terminal" },
        ["<leader>tt"]    = { "<cmd>FloatermToggle<CR>", opts = { silent = true }, "Toggle terminal" },
        ["<leader>to"]    = { "<cmd>FloatermNew<CR>", opts = { silent = true }, "Open new terminal" },
        ["<leader>tn"]    = { "<cmd>FloatermNext<CR>", opts = { silent = true }, "Next terminal" },
        ["<leader>tp"]    = { "<cmd>FloatermPrev<CR>", opts = { silent = true }, "Previous terminal" },
        ["<leader>ts"]    = { "<cmd>FloatermShow<CR>", opts = { silent = true }, "Show terminal" },
        ["<C-v>"]         = { "<C-\\><C-n>pi", "Paste in terminal", opts = { silent = true }, },
        ["<C-BS>"]        = { "<C-\\><C-n>bdw", opts = { silent = true }, "Delete word in terminal" },
        ["<C-q>"]         = { "<C-\\><C-n><cmd>FloatermToggle<CR>", opts = { silent = true }, "Quit terminal" },
        ["<leader><ESC>"] = { "<C-\\><C-n>", opts = { silent = true }, "Exit terminal mode" },
        ["<leader>tr"]    = {
            "<cmd>FloatermNew --width=0.4 --height=0.9 --position=right --wintype=float<CR>",
            opts = { silent = true },
            "Toggle terminal"
        },
        ["<leader>tf"]    = {
            "<cmd>FloatermNew --width=0.9 --height=0.9 --position=center --wintype=float<CR>",
            opts = { silent = true },
            "Toggle terminal"
        },
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

M.vscode_search_replace = {
    n = {
        ["<leader>S"] = {
            function()
                require("vscode-search-replace").open()
            end,
            "Global search & replace UI",
        },
        ["<leader>fs"] = {
            function()
                require("vscode-search-replace").open({ file = true, word = true })
            end,
            "Search word under cursor in current file",
        },
        ["<leader>fs"] = {
            function()
                require("vscode-search-replace").open({ word = true })
            end,
            "Global search: word under cursor",
        },
    },
    v = {
        ["<leader>sw"] = {
            function()
                require("vscode-search-replace").open({ word = true })
            end,
            "Global search: visual selection",
        },
    },
}

M.yanky = {
    n = {
        ["<leader>yy"] = {
            "<cmd>YankyRingHistory<CR>",
            "Open yank history",
        },
    },
    x = {
        ["<leader>yy"] = {
            "<cmd>YankyRingHistory<CR>",
            "Open yank history",
        },
    }
}

M.markview = {
    n = {
        ["mv"] = { "<cmd>Markview toggle<CR>", "Toggle Markview" },
    },
    x = {
        ["mv"] = { "<cmd>Markview toggle<CR>", "Toggle Markview" },
    }
}

M.spellwarn = {
    n = {
        ["<leader>sc"] = { "<cmd>Spellwarn toggle<CR>", "Toggle spell check" },
    }
}

M.overseer = {
    n = {
        ["<space>b"] = { "<cmd>OverseerRun<CR>", "Tasks" },
        ["<space>t"] = { "<cmd>OverseerToggle<CR>", "Tasks" },
        ["<C-S-B>"] = { "<cmd>OverseerRun<CR>", "Tasks" },
    }
}

M.markdowntable = {
    n = {
        ["<space>m"] = { "<cmd>Mtm<CR>", "Tasks" },
    },
    v = {
        ["<space>m"] = { "<cmd>Mtm<CR>", "Tasks" },
    }
}

M.jabs = {
    n = {
        ["<leader>b"] = { "<cmd>JABSOpen<CR>", "Open buffer switcher" },
    },
}

local function hop_hint(direction, options)
    options.direction = require("hop.hint").HintDirection[direction]
    require("hop").hint_char1(options)
end

M.hop = {
    n = {
        ["f"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true }) end, "Hop forward" },
        ["F"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true }) end, "Hop backward" },
        ["t"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
        ["T"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
    },
    x = {
        ["f"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true }) end, "Hop forward" },
        ["F"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true }) end, "Hop backward" },
        ["t"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
        ["T"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
    },
    o = {
        ["f"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true }) end, "Hop forward" },
        ["F"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true }) end, "Hop backward" },
        ["t"] = { function() hop_hint("AFTER_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
        ["T"] = { function() hop_hint("BEFORE_CURSOR", { current_line_only = true, hint_offset = -1 }) end, "Hop before character" },
    },
}

M.duplicate = {
    n = {
        ["<leader>dk"] = { "<cmd>LineDuplicate -1<CR>", "Duplicate line up" },
        ["<leader>dj"] = { "<cmd>LineDuplicate +1<CR>", "Duplicate line down" },
    },
    x = {
        ["<leader>dk"] = { "<cmd>VisualDuplicate -1<CR>", "Duplicate selection up" },
        ["<leader>dj"] = { "<cmd>VisualDuplicate +1<CR>", "Duplicate selection down" },
    },
}

return M
