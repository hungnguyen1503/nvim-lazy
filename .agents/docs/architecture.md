# Configuration Architecture

## Entry points and load order

`init.lua` is the entry point. It enables Neovim's native Lua loader, then
loads, in order: `config` (options — `mapleader` first — and autocmds),
`plugins` (lazy.nvim bootstrap and `lazy.setup`), `config.highlights` (applied
after the colorscheme loads), the keymap catalogue via
`require("config.utils").load_mappings()`, and finally the `cheatsheet` module.
Keep module initialization safe to load during normal startup; use `pcall` only
where an optional dependency is expected.

`lua/plugins/init.lua` bootstraps `lazy.nvim` into Neovim's data directory and
calls `lazy.setup(require("plugins.specs"), require("plugins.settings"))`.
`lua/plugins/specs.lua` combines the domain specification files under
`lua/plugins/`. Do not add startup imports to `init.lua`; use a Lazy trigger
instead.

## Directory ownership

- `lua/config/`: options, autocmds (all of them), keymap catalogue
  (`mappings.lua`), post-theme highlight overrides, the file-picker helper, and
  the shared mapping loader (`utils.lua`).
- `lua/plugins/`: active Lazy specifications, one file per domain —
  `colorscheme`, `editor`, `explorer`, `git`, `lsp`, `treesitter`, `ui` — plus
  `init.lua` (bootstrap), `specs.lua` (catalogue), and `settings.lua` (Lazy
  options, including disabled runtime plugins).
- `lua/plugins/setup/`: per-plugin configuration modules; each is required
  exactly once by its domain spec's `config` function.
- `lua/cheatsheet/`: in-editor cheat-sheet content.
- `spell/`: custom spell-file source and compiled dictionary.
- `dotfiles/`: non-Neovim shell/terminal files kept for reference only.

## Plugin changes

Use a plugin's existing setup module and the `lazy.nvim` specification format
in its domain file. Keep plugin source identifiers as `owner/repository`; every
standalone spec needs `event`, `cmd`, `ft`, or `keys`. Dependencies load with
their parent. Run `:Lazy sync` after changing specifications so
`lazy-lock.json` records resolved revisions. Keep the active catalog within
60-70 packages, including dependencies, unless a requested capability requires
a documented trade-off.

`VeryLazy` is reserved for plugins that startup code, autocmds, or global
keymaps `require()` synchronously. Everything else — trees, tablines,
pickers — must load on its own command or buffer event so it never runs during
startup.

Use [plugin-catalog.md](plugin-catalog.md) to choose the owning domain before
adding or removing a plugin. Update that catalog in the same change as any
specification change.

Neovide-specific behavior belongs behind `if vim.g.neovide then` in
`lua/config/options.lua` or a directly related plugin configuration. Do not
load Neovide behavior when `vim.g.neovide` is absent.
