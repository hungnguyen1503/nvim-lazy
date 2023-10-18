local status_ok, tabtree = pcall(require, "tabtree")
if not status_ok then
    print("Error: tabout")
    return
end

local options = {
    -- print the capture group name when executing next/previous
    --debug = true,

    -- disable key bindings
    --key_bindings_disabled = true,

    key_bindings = {
        next = "<Tab>",
        previous = "<S-Tab>",
    },

    -- INFO: InspectTree to discover the (capture group)
    -- @capture_name can be anything
    language_configs = {
        python = {
            target_query = [[
              (string) @string_capture
              (interpolation) @interpolation_capture
              (parameters) @parameters_capture
              (argument_list) @argument_list_capture
              (subscript) @subscript_capture
              (list) @list_capture
              (parenthesized_expression) @parenthesized_expression_capture
            ]],
            -- experimental feature, to move the cursor in certain situations like when handling python f-strings
            offsets = {
                string_start_capture = 1,
            },
        },
        c = {
            target_query = [[
              (preproc_include) @preproc_include_capture
              (preproc_def) @preproc_def_capture
              (parenthesized_expression) @parenthesized_expression_capture
              (parameter_list) @parameter_list_capture
              (initializer_list) @initializer_list_capture
              (argument_list) @argument_list_capture
              (compound_statement) @compound_statement_capture
              (enumerator_list) @enumerator_list_capture
              (field_declaration_list) @field_declaration_list_capture
              (system_lib_string) @system_lib_string_capture
              (string_literal) @string_literal_capture
              (char_literal) @char_literal_capture
              (for_statement) @for_statement_capture
            ]],
            -- experimental feature, to move the cursor in certain situations like when handling python f-strings
            offsets = {
                string_start_capture = 1,
            },
        },
        lua = {
            target_query = [[
              (string) @string_capture
              (string_content) @string_content_capture
              (table_constructor) @table_constructor_capture
              (string_content) @string_content_capture
              (parameters) @parameters_capture
              (arguments) @arguments_capture
              (bracket_index_expression) @bracket_index_expression_capture
              (field) @field_capture
            ]],
            -- experimental feature, to move the cursor in certain situations like when handling python f-strings
            offsets = {
                string_start_capture = 1,
            },
        }
    },

    default_config = {
        target_query = [[
              (string) @string_capture
              (interpolation) @interpolation_capture
              (parameters) @parameters_capture
              (argument_list) @argument_list_capture
          ]],
        offsets = {},
    }
}

tabtree.setup(options)
