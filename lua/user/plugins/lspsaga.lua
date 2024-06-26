local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
    return
end

local options = {
    preview = {
        lines_above = 5,
        lines_below = 5,
    },
    scroll_preview = {
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    request_timeout = 2000,
    finder = {
        max_height = 0.6,
        left_width = 0.3,
        right_width = 0.9,
        method = {},
        default = 'tyd+ref+imp+def',
        layout = 'float',
        filter = {},
        silent = false,
        keys = {
            shuttle = '[w',
            toggle_or_oppen = 'o',
            vsplit = 'v',
            split = 'h',
            tabe = 't',
            quit = { 'q', '<ESC>' },
            close_in_preview = { 'q', '<ESC>' },
        },
    },
    implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
    },
    definition = {
        width = '0.8',
        height = '0.5',
        keys = {
            edit = 'o',
            vsplit = 'v',
            split = 'h',
            tabe = 't',
            quit = { 'q', '<ESC>' },
            close = { 'q', '<ESC>' },
        },
    },
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    diagnostic = {
        show_code_action = true,
        show_layout = 'float',
        show_normal_height = 10,
        jump_num_shortcut = true,
        max_width = 0.8,
        max_height = 0.6,
        max_show_width = 0.9,
        max_show_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        extend_relatedInformation = true,
        diagnostic_only_current = false,
        keys = {
            exec_action = 'o',
            quit = { 'q', '<ESC>' },
            toggle_or_jump = '<CR>',
            quit_in_show = { 'q', '<ESC>' },
        },
    },
    hover = {
        max_width = 0.8,
        max_height = 0.8,
        open_link = 'gx',
    },
    rename = {
        in_select = true,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,
        keys = {
            quit = { 'q', '<ESC>' },
            exec = '<CR>',
            select = 'x',
        }
    },
    outline = {
        enable = false,
        layout = 'normal',
        win_position = 'right',
        win_width = 50,
        auto_preview = true,
        detail = true,
        auto_close = false,
        close_after_jump = false,
        max_height = 0.7,
        left_width = 0.25,
        keys = {
            toggle_or_jump = 'o',
            quit = { 'q', '<ESC>' },
            jump = '<CR>'
        },
    },
    callhierarchy = {
        layout = 'float',
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = { 'q', '<ESC>' },
            shuttle = 'w',
            toggle_or_req = 'u',
            close = '<Esc>',
        },
    },
    symbol_in_winbar = {
        enable = false,
        separator = '  ',
    },
    beacon = {
        enable = true,
        frequency = 7,
    },
    ui = {
        title = true,
        border = "rounded",
        devicon = true,
        expand = '',
        collapse = '',
        code_action = '💡',
        actionfix = ' ',
        lines = { '└', '├', '│', ' ', '┌' },
        imp_sign = '󰳛 ',
        kind = {},
    },
}

lspsaga.setup(options)
