-- nvim-treesitter-textobjects "main" branch API: no module registry; setup only
-- tunes behavior and keymaps call into the functions directly.
local to = require("nvim-treesitter-textobjects")

to.setup({
    select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- Mode used per capture ('v' charwise, 'V' linewise, '<c-v>' blockwise)
        selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
        },
        -- Extend textobjects to include surrounding whitespace
        include_surrounding_whitespace = false,
    },
    move = {
        set_jumps = true, -- whether to set jumps in the jumplist
    },
})

local select_t = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

local function obj(fn, capture, group)
    return function()
        fn(capture, group or "textobjects")
    end
end

-- Text objects: select
vim.keymap.set({ "x", "o" }, "ap", obj(select_t.select_textobject, "@parameter.outer"), { desc = "A parameter" })
vim.keymap.set({ "x", "o" }, "ip", obj(select_t.select_textobject, "@parameter.inner"), { desc = "Inner parameter" })
vim.keymap.set({ "x", "o" }, "a/", obj(select_t.select_textobject, "@comment.outer"), { desc = "A comment" })

-- Text objects: move (next/previous start/end)
local move_modes = { "n", "x", "o" }
vim.keymap.set(move_modes, "]p", obj(move.goto_next_start, "@parameter.inner"), { desc = "Next parameter" })
vim.keymap.set(move_modes, "]c", obj(move.goto_next_start, "@comment.outer"), { desc = "Next comment" })
vim.keymap.set(move_modes, "]z", obj(move.goto_next_start, "@fold", "folds"), { desc = "Next fold" })
vim.keymap.set(move_modes, "]P", obj(move.goto_next_end, "@parameter.inner"), { desc = "Next parameter end" })
vim.keymap.set(move_modes, "]C", obj(move.goto_next_end, "@comment.outer"), { desc = "Next comment end" })
vim.keymap.set(move_modes, "[p", obj(move.goto_previous_start, "@parameter.inner"), { desc = "Prev parameter" })
vim.keymap.set(move_modes, "[c", obj(move.goto_previous_start, "@comment.outer"), { desc = "Prev comment" })
vim.keymap.set(move_modes, "[z", obj(move.goto_previous_start, "@fold", "folds"), { desc = "Prev fold" })
vim.keymap.set(move_modes, "[P", obj(move.goto_previous_end, "@parameter.inner"), { desc = "Prev parameter end" })
vim.keymap.set(move_modes, "[C", obj(move.goto_previous_end, "@comment.outer"), { desc = "Prev comment end" })
