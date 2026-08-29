local M = {}
local merge_tb = vim.tbl_deep_extend

-- Register every mapping section from lua/config/mappings.lua.
-- `section` (optional) limits registration to one section; `mapping_opt` supplies
-- default keymap opts (e.g. { buffer = bufnr }) merged under each mapping's own opts.
M.load_mappings = function(section, mapping_opt)
    local function set_section_map(section_values)
        if section_values.plugin then
            return
        end
        section_values.plugin = nil

        for mode, mode_values in pairs(section_values) do
            local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
            for keybind, mapping_info in pairs(mode_values) do
                -- merge default + user opts
                local opts = merge_tb("force", default_opts, mapping_info.opts or {})

                mapping_info.opts, opts.mode = nil, nil
                opts.desc = mapping_info[2]

                vim.keymap.set(mode, keybind, mapping_info[1], opts)
            end
        end
    end

    local mappings = require("config.mappings")

    if type(section) == "string" then
        mappings[section]["plugin"] = nil
        mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
        set_section_map(sect)
    end
end

return M
