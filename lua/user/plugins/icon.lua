local M = {}

M.lspkind = {
    Array = '󰅪 ',
    Boolean = ' ',
    BreakStatement = '󰙧 ',
    Call = '󰃷 ',
    CaseStatement = '󱃙 ',
    Class = ' ',
    Color = '󰏘 ',
    Constant = '󰏿 ',
    Constructor = ' ',
    ContinueStatement = ' ',
    Copilot = ' ',
    Declaration = '󰙠 ',
    Delete = '󰩺 ',
    DoStatement = '󰑖 ',
    Enum = ' ',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = '󰈔 ',
    Folder = ' ',
    ForStatement = '󰑖 ',
    Function = '󰊕 ',
    Identifier = '󰀫 ',
    IfStatement = ' ',
    Interface = ' ',
    Keyword = ' ',
    List = '󰅪 ',
    Log = '󰦪 ',
    Lsp = ' ',
    Macro = '󰁌 ',
    MarkdownH1 = '󰉫 ',
    MarkdownH2 = '󰉬 ',
    MarkdownH3 = '󰉭 ',
    MarkdownH4 = '󰉮 ',
    MarkdownH5 = '󰉯 ',
    MarkdownH6 = '󰉰 ',
    Method = '󰆧 ',
    Module = '󰏗 ',
    Namespace = '󰅩 ',
    Null = '󰢤 ',
    Number = '󰎠 ',
    Object = '󰅩 ',
    Operator = '󰆕 ',
    Package = '󰆦 ',
    Property = ' ',
    Reference = '󰦾 ',
    Regex = ' ',
    Repeat = '󰑖 ',
    Scope = '󰅩 ',
    Snippet = ' ',
    Specifier = '󰦪 ',
    Statement = '󰅩 ',
    String = '󰉾 ',
    Struct = ' ',
    SwitchStatement = ' ',
    Text = '󰦪 ',
    Type = ' ',
    TypeParameter = '󰆩 ',
    Unit = ' ',
    Value = '󰎠 ',
    Variable = ' ',
    WhileStatement = '󰑖 ',
    TabNine = "",
}

M.statusline_separators = {
    default = {
        left = "",
        right = " ",
    },
    round = {
        left = "",
        right = "",
    },
    block = {
        left = "█",
        right = "█",
    },
    arrow = {
        left = "",
        right = "",
    },
}

M.devicons = {
    default_icon = {
        icon = "",
        name = "Default",
    },
    c = {
        icon = "",
        name = "c",
    },
    css = {
        icon = "",
        name = "css",
    },
    deb = {
        icon = "",
        name = "deb",
    },
    Dockerfile = {
        icon = "",
        name = "Dockerfile",
    },
    html = {
        icon = "",
        name = "html",
    },
    jpeg = {
        icon = "",
        name = "jpeg",
    },
    jpg = {
        icon = "",
        name = "jpg",
    },
    js = {
        icon = "",
        name = "js",
    },
    kt = {
        icon = "",
        name = "kt",
    },
    lock = {
        icon = "",
        name = "lock",
    },
    lua = {
        icon = "",
        name = "lua",
    },
    mp3 = {
        icon = "",
        name = "mp3",
    },
    mp4 = {
        icon = "",
        name = "mp4",
    },
    out = {
        icon = "",
        name = "out",
    },
    png = {
        icon = "",
        name = "png",
    },
    py = {
        icon = "",
        name = "py",
    },
    ["robots.txt"] = {
        icon = "ﮧ",
        name = "robots",
    },
    toml = {
        icon = "",
        name = "toml",
    },
    ts = {
        icon = "ﯤ",
        name = "ts",
    },
    ttf = {
        icon = "",
        name = "TrueTypeFont",
    },
    rb = {
        icon = "",
        name = "rb",
    },
    rpm = {
        icon = "",
        name = "rpm",
    },
    vue = {
        icon = "🕌",
        name = "vue",
    },
    woff = {
        icon = "",
        name = "WebOpenFontFormat",
    },
    woff2 = {
        icon = "",
        name = "WebOpenFontFormat2",
    },
    xz = {
        icon = "",
        name = "xz",
    },
    zip = {
        icon = "",
        name = "zip",
    },
}

return M
