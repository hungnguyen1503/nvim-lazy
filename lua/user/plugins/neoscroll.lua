local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

neoscroll.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', '<C-j>', '<C-k>', 'zt', 'zz', 'zb' },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "cubic", -- Default easing function
    pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
    post_hook = function(info) if info == "cursorline" then vim.wo.cursorline = true end end,
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

local mappings = {}
-- Syntax: t[keys] = {function, {function arguments}}
mappings['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '350', [['cubic']] } }
mappings['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '350', [['cubic']] } }

-- Use the "cubic" easing function
mappings['<C-b>'] = { 'scroll', { '-0.9', 'true', '400', [['cubic']] } }
mappings['<C-f>'] = { 'scroll', { '0.9', 'true', '400', [['cubic']] } }

-- Pass "cubic" to disable the easing animation (constant scrolling speed)
mappings['<C-y>'] = { 'scroll', { '-0.01', 'true', '200', [['cubic']] } }
mappings['<C-e>'] = { 'scroll', { '0.01', 'true', '200', [['cubic']] } }

mappings['<C-k>'] = { 'scroll', { '-0.25', 'true', '200', [['sine']] } }
mappings['<C-j>'] = { 'scroll', { '0.25', 'true', '200', [['sine']] } }

mappings['<ScrollWheelUp>'] = { 'scroll', { '-0.25', 'true', '200', [['sine']] } }
mappings['<ScrollWheelDown>'] = { 'scroll', { '0.25', 'true', '200', [['sine']] } }

-- When no easing function is provided the default easing function (in this case "quadratic") will be used
mappings['zt'] = { 'zt', { '250' } }
mappings['zz'] = { 'zz', { '250' } }
mappings['zb'] = { 'zb', { '250' } }

require('neoscroll.config').set_mappings(mappings)
