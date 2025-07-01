local status_ok, markview = pcall(require, "markview")
if not status_ok then
    print("Error: mkv")
    return
end

--- Configuration table for `markview.nvim`.
---@class mkv.config
---
---@field experimental config.experimental | fun(): config.experimental
---@field highlight_groups { [string]: config.hl } | fun(): { [string]: config.hl }
---@field html config.html | fun(): config.html
---@field latex config.latex | fun(): config.latex
---@field markdown config.markdown | fun(): config.markdown
---@field markdown_inline config.markdown_inline | fun(): config.markdown_inline
---@field preview config.preview | fun(): config.preview
---@field renderers config.renderer[] | fun(): config.renderer[]
---@field typst config.typst | fun(): config.typst
---@field yaml config.yaml | fun(): config.yaml

local options = {
    experimental = {
        date_formats = {},
        date_time_formats = {},

        text_filetypes = {},
        read_chunk_size = 1000,
        link_open_alerts = false,
        file_open_command = "tabnew",

        list_empty_line_tolerance = 3
    },
    highlight_groups = {},
    preview = {
        enable = true,
        filetypes = { "md", "rmd", "quarto" },
        ignore_buftypes = { "nofile" },
        ignore_previews = {},

        modes = { "n", "no", "c" },
        hybrid_modes = {},
        debounce = 50,
        draw_range = { vim.o.lines, vim.o.lines },
        edit_range = { 1, 0 },

        callbacks = {},

        splitview_winopts = { split = "left" }
    },
    renderers = {},

    html = {
        enable = true,

        container_elements = {},
        headings = {},
        void_elements = {},
    },
    latex = {
        enable = true,

        blocks = {},
        commands = {},
        escapes = {},
        fonts = {},
        inlines = {},
        parenthesis = {},
        subscripts = {},
        superscripts = {},
        symbols = {},
        texts = {}
    },
    markdown = {
        enable = true,

        block_quotes = {},
        code_blocks = {},
        headings = {},
        horizontal_rules = {},
        list_items = {},
        metadata_plus = {},
        metadata_minus = {},
        tables = {}
    },
    markdown_inline = {
        enable = true,

        block_references = {},
        checkboxes = {},
        emails = {},
        embed_files = {},
        entities = {},
        escapes = {},
        footnotes = {},
        highlights = {},
        hyperlinks = {},
        images = {},
        inline_codes = {},
        internal_links = {},
        uri_autolinks = {}
    },
    typst = {
        enable = true,

        codes = {},
        escapes = {},
        headings = {},
        labels = {},
        list_items = {},
        math_blocks = {},
        math_spans = {},
        raw_blocks = {},
        raw_spans = {},
        reference_links = {},
        subscripts = {},
        superscript = {},
        symbols = {},
        terms = {},
        url_links = {}
    },
    yaml = {
        enable = true,

        properties = {}
    }
}

markview.setup(options)
