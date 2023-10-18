local present, cmp = pcall(require, "cmp")
if not present then
    return
end

vim.o.completeopt = "menu,menuone,noselect"

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local kinds = {
    nvim_lsp                  = "[🌈 LSP]",
    nvim_lsp_document_symbols = "[🤡 Doc]",
    luasnip                   = "[🚀 Snippet]",
    vsnip                     = "[🚀 Snippet]",
    buffer                    = "[👾 Buffer]",
    luasnip_choice            = "[🚀 Snippet]",
    buffer_lines              = "[👾 Buffer]",
    cmdline                   = "[🖥️ Cmd]",
    cmdline_history           = "[🖥️ History]",
    path                      = "[🔗 Path]",
    cmp_tabnine               = "[🤖] TabNine",
    treesitter                = "[🌳] Treesitter",
}

local cmp_window = require("cmp.utils.window")
cmp_window.info_ = cmp_window.info
cmp_window.info_ = function(self)
    local info = self:info_()
    info.scrollable = false
    return info
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local options = {
    window = {
        completion = {
            scrollbar = false,
            max_width = 30,
            max_height = 25,
            border = border("LspSagaHoverBorder"),
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border("CmpDocumentationBorder"),
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, vim_item)
            local icons = require("user.plugins.icon").lspkind
            local duplicates = {
                path = 1,
                buffer = 1,
                nvim_lsp = 0,
                luasnip = 1,
                cmdline_history = 0,
            }
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            vim_item.menu = (kinds)[_.source.name]

            if _.source.name == "vsnip" or _.source.name == "nvim_lsp" or _.source.name == "luasnip" then
                vim_item.dup = duplicates[_.source.name] or 0
            end
            local maxwidth = 30
            vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
            return vim_item
        end,
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            require("cmp-under-comparator").under,
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    mapping = {
        ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]     = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]     = cmp.mapping.close(),
        ["<CR>"]      = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "luasnip", priority = 9, max_item_count = 12, option = { show_autosnippets = true } },
        { name = "luasnip_choice", priority = 9 },
        { name = "nvim_lsp", priority = 10, max_item_count = 12 },
        { name = 'cmp_tabnine', priority = 8, max_item_count = 15 },
        {
            name = "buffer",
            priority = 7,
            keyword_length = 2,
            max_item_count = 10,
            option = {
                get_bufnrs = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                    if byte_size > 1024 * 1024 then -- 1 Megabyte max
                        return {}
                    end
                    return { buf }
                end
            }
        },
        { name = "treesitter", max_item_count = 1 },
        { name = "path", priority = 6 },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
    },
}

cmp.setup(options)

cmp.setup.cmdline(':', {
    mapping = require("cmp").mapping.preset.cmdline(),
    sources = require("cmp").config.sources({
        { name = 'cmdline', priority = 3 },
        { name = 'path', priority = 2 },
        {
            name = 'cmdline_history',
            priority = 1,
            max_item_count = 3,
        },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = require("cmp").mapping.preset.cmdline(),
    sources = require("cmp").config.sources({
        { name = 'nvim_lsp_document_symbols', priority = 4 },
        {
            name = 'buffer',
            option = { keyword_pattern = [[\k\+]] },
            priority = 3,
        },
        {
            name = 'buffer-lines',
            option = {
                words = true,
                comments = true,
            },
            priority = 2,
        },
    })
})

require('cmp_luasnip_choice').setup({
    auto_open = true
});

cmp.mapping(function()
    if cmp.get_active_entry() then
        cmp.confirm()
    else
        require 'ultimate-autopair.maps.cr'.cmpnewline()
    end
end)

-- INFO: This feature should be used for python language due to it will be duplicated bracket in another languages
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local Kind = cmp.lsp.CompletionItemKind
        cmp.event:on(
            'confirm_done',
            function(evt)
                if vim.tbl_contains({ Kind.Function, Kind.Method }, evt.entry:get_completion_item().kind) then
                    vim.api.nvim_feedkeys('()' .. vim.api.nvim_replace_termcodes('<Left>', true, true, true), 'n', false)
                end
            end)
    end
})

local tabnine = require('cmp_tabnine.config')

tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
    show_prediction_strength = false
})
