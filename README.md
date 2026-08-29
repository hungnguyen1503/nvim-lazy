# Neovim configuration

Personal Neovim and Neovide configuration for Windows. Plugins are managed by
`lazy.nvim`; the resolved catalog is kept to ~70 packages, including
dependencies.

## Layout

- `init.lua`: entry point. Enables the bytecode loader, then loads
  `config` → `plugins` → `config.highlights` → mappings → cheatsheet.
- `lua/config/`: `options.lua` (leader, all options), `autocmds.lua` (every
  autocmd), `mappings.lua` (the keymap catalogue), `highlights.lua` (post-theme
  highlight overrides), `pickers.lua` (git-or-fd file picker), `utils.lua`
  (mapping loader shared with LSP `on_attach`).
- `lua/plugins/`: Lazy specification per domain — `colorscheme`, `editor`,
  `explorer`, `git`, `lsp`, `treesitter`, `ui` — plus `init.lua` (lazy.nvim
  bootstrap), `specs.lua` (the catalogue) and `settings.lua` (lazy options).
- `lua/plugins/setup/`: one configuration module per plugin, required by the
  domain specs at load time.
- `lua/cheatsheet/`: in-editor cheat-sheet (`<leader>ch`).
- `scripts/test-config.ps1`: repeatable configuration validation.
- `dotfiles/`: unrelated shell/terminal files kept for reference
  (`.wezterm.lua`, `.zshrc`, `.p10k.zsh`, …).

## Performance rules

The layout exists to keep startup and typing latency down, especially in large
repos such as the REDACTED tree (~12k files):

- Every plugin spec MUST declare a trigger (`event`, `cmd`, `ft`, `keys`).
  `VeryLazy` is reserved for plugins that global code or keymaps `require()`
  synchronously (window-picker, bufdelete, spider, noice/notify, …); tree,
  tabline, and search UIs are `cmd`/buffer-event lazy.
- File picker: `<leader>ff`/`<leader>fb` use `git ls-files` inside a repository
  (~0.5 s for 12k files) and fall back to `fd` outside one. `<leader>fa` is the
  exhaustive `fd --no-ignore` scan (includes submodule contents).
- `vim.loader` and the lazy.nvim module cache are enabled; unused runtime
  plugins (`gzip`, `zipPlugin`, `tarPlugin`, `tohtml`, `tutor`, `matchparen`)
  are disabled in `lua/plugins/settings.lua`.
- Spell checking is buffer-local (c/h buffers only), completion fuzzy matching
  uses blink.cmp's Rust engine.
- vim-illuminate skips buffers over 5000 lines (`max_file_lines` in
  `lua/plugins/setup/illuminate.lua`) — the generated GUIX/resource C files in
  the REDACTED tree (12–22k lines) re-ran the reference scan on every cursor move.

## Use

Open Neovim normally with `nvim`. On the first start, `lazy.nvim` installs the
locked plugin revisions. Run `:Lazy sync` after updating plugin specifications;
do not edit `lazy-lock.json` manually.

Completion uses `blink.cmp` with LSP, path, snippet, and buffer sources. In its
menu, use `Tab`/`Shift-Tab` to select and `Enter` to accept. In Normal mode,
`Ctrl-J` scrolls the viewport down and `Ctrl-K` scrolls it up with the restored
NeoScroll settings.

## Validate

```powershell
./scripts/test-config.ps1
nvim --headless '+Lazy! sync' '+qall'
```

Then open a source file and run `:checkhealth`. See [AGENTS.md](AGENTS.md) and
[architecture notes](.agents/docs/architecture.md) for contributor guidance.
Use the [plugin catalog](.agents/docs/plugin-catalog.md) to find a plugin's
category, purpose, and configuration owner.
