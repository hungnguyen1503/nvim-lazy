local rainbow = require("rainbow-delimiters")

require("rainbow-delimiters.setup").setup({
    strategy = {
        [""] = rainbow.strategy.global,
        commonlisp = rainbow.strategy["local"],
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        html = "rainbow-parens",
        tsx = "rainbow-parens",
    },
})
