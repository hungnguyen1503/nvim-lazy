local ok, tabtree = pcall(require, "tabtree")
if not ok then
    return
end

tabtree.setup({
    key_bindings = { next = "<C-\\>", previous = "<C-|>" },
    language_configs = {
        python = {
            target_query = "(string) @string_capture (parameters) @parameters_capture (argument_list) @argument_list_capture",
        },
        c = {
            target_query = "(parenthesized_expression) @parenthesized_expression_capture (argument_list) @argument_list_capture (compound_statement) @compound_statement_capture",
        },
        lua = {
            target_query = "(string) @string_capture (table_constructor) @table_constructor_capture (arguments) @arguments_capture",
        },
    },
    default_config = {
        target_query = "(string) @string_capture (parameters) @parameters_capture (argument_list) @argument_list_capture",
        offsets = {},
    },
})
