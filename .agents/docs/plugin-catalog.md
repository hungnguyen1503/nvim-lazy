# Plugin Catalog

`lua/plugins/<domain>.lua` is the source of truth for active specs. Keep
each plugin in one category and update this file with the same change. Items in
**Shared** are dependencies; do not create duplicate specs for them.

## Colorscheme

- `tokyonight.nvim` — editor colours.

## Explorer

- `neo-tree.nvim` — responsive file and buffer browser; Git and diagnostic decoration are disabled.
- `window-picker` — target-window selection for Neo-tree.

## Git and history

- `gitsigns.nvim` — inline Git hunks.
- `lazygit.nvim` — `:LazyGit` interface.
- `diffview.nvim` — `:DiffviewOpen` and file history.

## Editor and workflow

- `nvim-surround`, `nvim-autopairs`, `tabout.nvim` — paired-text editing.
- `move.nvim`, `duplicate.nvim`, `align.nvim` — structural text editing.
- `nvim-spider`, `flash.nvim`, `hop.nvim` — code navigation.
- `vim-argwrap`, `highlight-undo.nvim` — focused edits (line commenting is native `gc`).
- `fzf-lua` — files, grep, buffers, marks, commands, and UI selection through the `fzf` executable.
- `neovim-project`, `neovim-session-manager`, `vim-floaterm`, `overseer.nvim` — projects, sessions, terminals, and tasks.
- `yanky.nvim` — yank history; `sqlite.lua` stores it.
- `vim-illuminate`, `nvim-colorizer.lua`, `indent-blankline.nvim`, `todo-comments.nvim` — code readability.
- `trouble.nvim`, `nvim-spectre`, `spellwarn.nvim`, `nvim-lastplace` — diagnostics, replacement, spelling, and cursor restore.
- `nvim-vscode-search-replace` (`hungnguyen1503/nvim-vscode-search-replace`) — `:SearchReplace` VS Code-style search & replace UI built on nui-components: `<leader>S` global, `<C-F>` current file, `<leader>sw` word/visual-selection; search-row toggle BOXES that fill while active — `⇄` replace-mode icon box left of the (fixed-width) search field, `ab` whole-word / `Aa` case / `.*` regex right of it, trailing `?` help box; the replace row adds `AB` preserve-case and an icon-only `⇉` Replace All that asks a Yes/No dialog; every widget (boxes, inputs, results-tree rows, help overlay, dialog buttons) is mouse-clickable; inside the float `Esc`/`q` close, `<CR>` jump, `<C-R>` Replace All, `<A-h>/<A-j>/<A-k>/<A-l>` panel navigation, `<A-c>/<A-w>/<A-r>/<A-p>` toggle hotkeys, `?` keymap help overlay. Spectre keeps `:Spectre` only (global keymaps removed).
- `markdown-table-mode.nvim`, `markview.nvim` — Markdown editing and preview.

## Language intelligence and completion

- `nvim-lspconfig` — built-in LSP client server definitions.
- `mason.nvim`, `mason-tool-installer.nvim` — external language tools.
- `blink.cmp` — only completion engine; LSP, path, snippets, and buffers.
- `LuaSnip`, `friendly-snippets` — Blink snippet support.
- `lazydev.nvim`, `luvit-meta` — Lua/Neovim development types.
- `lspsaga.nvim`, `outline.nvim`, `fidget.nvim`, `windows.nvim` — LSP UI and progress.

## Treesitter and syntax

- `nvim-treesitter`, `nvim-treesitter-textobjects` — parser-based highlighting and motions.
- `nvim-treesitter-endwise`, `nvim-ts-autotag` — language-aware closing constructs.
- `rainbow-delimiters.nvim` — nested delimiter colours.

## User interface

- `alpha-nvim` — start screen.
- `lualine.nvim`, `dropbar.nvim`, `bufferline.nvim` — status, path, and buffer UI.
- `JABS.nvim` — buffer switching.
- `nvim-notify`, `noice.nvim`, `dressing.nvim`, `neoscroll.nvim` — messages, command UI, selections, and smooth scrolling.

## Shared dependencies

- `lazy.nvim` — plugin manager.
- `nvim-web-devicons` — icons.
- `plenary.nvim` — Lua utility dependency.
- `nui.nvim` — Neovim UI components.

## Maintenance rules

1. Add a spec in the category that owns its user-facing behavior.
2. Put setup code in `lua/plugins/setup/<domain>/<name>.lua`; keep the spec thin.
3. Add any new plugin and its reason above, then run `:Lazy sync` and `./scripts/test-config.ps1`.
4. Remove the catalog entry, its setup module, mappings, and lockfile entry together when retiring a plugin.
