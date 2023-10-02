local status_ok, textobjects = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- build in text objects.
-- @block.inner
-- @block.outer
-- @call.inner
-- @call.outer
-- @class.inner
-- @class.outer
-- @comment.outer
-- @conditional.inner
-- @conditional.outer
-- @frame.inner
-- @frame.outer
-- @function.inner
-- @function.outer
-- @loop.inner
-- @loop.outer
-- @parameter.inner
-- @parameter.outer
-- @scopename.inner
-- @statement.outer
local options = {
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                -- ["af"] = "@function.outer",
                -- ["if"] = "@function.inner",
                -- ["as"] = "@class.outer",
                -- ["is"] = "@class.inner",
                -- ["ac"] = "@call.outer",
                -- ["ic"] = "@call.inner",
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                -- ["al"] = "@loop.outer",
                -- ["il"] = "@loop.inner",
                -- ["ai"] = "@conditional.outer",
                -- ["ii"] = "@conditional.inner",
                ["a/"] = "@comment.outer",
                ["ac"] = "@comment.inner",
                -- ["ak"] = "@block.outer",
                -- ["ik"] = "@block.inner",
            },
        },

        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                -- ["]f"] = "@function.inner",
                -- ["]nf"] = "@function.outer",
                -- ["]s"] = "@class.outer",
                ["]p"] = "@parameter.inner",
                -- ["]c"] = "@call.outer",
                -- ["]b"] = "@block.outer",
                -- ["]i"] = "@conditional.outer",
                -- ["]l"] = "@loop.outer",
            },
            goto_next_end = {
                -- ["]F"] = "@function.inner",
                -- ["]nF"] = "@function.outer",
                -- ["]S"] = "@class.outer",
                ["]P"] = "@parameter.inner",
                -- ["]C"] = "@call.outer",
                -- ["]B"] = "@block.outer",
                -- ["]I"] = "@conditional.outer",
                -- ["]L"] = "@loop.outer",
            },
            goto_previous_start = {
                -- ["[f"] = "@function.inner",
                -- ["[nf"] = "@function.outer",
                -- ["[s"] = "@class.outer",
                ["[p"] = "@parameter.inner",
                -- ["[c"] = "@call.outer",
                -- ["[b"] = "@block.outer",
                -- ["[i"] = "@conditional.outer",
                -- ["[l"] = "@loop.outer",
            },
            goto_previous_end = {
                -- ["[F"] = "@function.inner",
                -- ["[nF"] = "@function.outer",
                -- ["[S"] = "@class.outer",
                ["[P"] = "@parameter.inner",
                -- ["[C"] = "@call.outer",
                -- ["[B"] = "@block.outer",
                -- ["[I"] = "@conditional.outer",
                -- ["[L"] = "@loop.outer",
            },
        },
    }
}

textobjects.setup(options)
