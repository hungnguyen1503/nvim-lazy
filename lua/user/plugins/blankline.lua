local present, blankline = pcall(require, "ibl")
if not present then
    return
end

local options = {
    enabled = true,
    indent = {
        char = "│",
        highlight = "IblIndent",
        smart_indent_cap = true,
    },
    whitespace = {
        highlight = "IblWhitespace",
        remove_blankline_trail = true,
    },
    scope = {
        char = "│",
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = false,
        highlight = "IblScope",
        include = {
            node_type = {
                c = {
                    "case_statement"
                },
                lua = {
                    "table_constructor",
                    "assignment_statement",
                },
                python = {
                    "with_statement",
                    "for_statement",
                    "if_statement",
                    "iftype_statement",
                    "elseif_block",
                    "elseiftype_block",
                    "else_block",
                    "for_statement",
                    "while_statement",
                    "try_statement",
                    "with_statement",
                    "repeat_statement",
                    "recover_statement",
                    "match_statement",
                    "case_statement",
                }
            }
        },
        exclude = {
            language = {},
        },
    },
    exclude = {
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "Trouble",
            "lazy",
        },
        buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
            "alpha",
            "dashboard",
        },
    },
}

blankline.setup(options)
