<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim"><br>
  <a href="https://neovim.io"><img src="https://img.shields.io/badge/Neovim-0.11+-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim"></a>
  <a href="https://github.com/folke/lazy.nvim"><img src="https://img.shields.io/badge/Manager-lazy.nvim-6C3EB5?style=for-the-badge" alt="lazy.nvim"></a>
  <a href="https://github.com/folke/tokyonight.nvim"><img src="https://img.shields.io/badge/Theme-Tokyo--Night-1a1b26?style=for-the-badge" alt="Tokyo Night"></a>
  <a href="https://github.com/neovide/neovide"><img src="https://img.shields.io/badge/GUI-Neovide-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Neovide"></a>
  <img src="https://img.shields.io/badge/Plugins-69-2f81f7?style=for-the-badge" alt="69 plugins">
</h1>

<p align="center">
  ⚡ A hand-tuned, fully lazy-loaded Neovim configuration for Windows.<br>
  Every plugin declares a trigger — nothing loads that you don't open.<br>
  Fast enough for 12k-file repositories, pretty enough for Neovide.
</p>

---

# 💥 Install Instructions

> Requires **Neovim 0.11+** (native `vim.loader` + `vim.lsp.config`).
> Always review the code before installing a configuration.

```powershell
# Windows — Neovim reads %LOCALAPPDATA%\nvim natively
git clone https://github.com/hungnguyen1503/nvim-lazy.git $env:LOCALAPPDATA\nvim
nvim    # lazy.nvim bootstraps itself and installs the locked plugin revisions
```

```sh
# Linux / macOS
git clone https://github.com/hungnguyen1503/nvim-lazy.git ~/.config/nvim
nvim    # same: plugins self-install on first start
```

Run `:Lazy sync` after pulling configuration updates.
`lazy-lock.json` records the resolved revisions — let lazy.nvim write it, never edit it by hand.

# 🛠 Supported Applications

- 🌗 **fd** — exhaustive file scanning (`<leader>fa`)
- 🔍 **ripgrep** — live grep, project replace, todo search
- 🎯 **fzf** — the picker engine behind fzf-lua
- 🚀 **lazygit** — full Git UI inside the editor (`<leader>gg`)
- 📁 **git** — the file picker lists the git index (~0.5 s in huge repos) and falls back to `fd` outside a repository
- 🔤 **CaskaydiaCove Nerd Font** — icons and statusline glyphs
- 🪟 **Neovide** *(optional)* — GUI polish stays behind `vim.g.neovide` guards, terminal Neovim untouched

# ✨ Plugins

### 🎨 Colorscheme
+ [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — Night Storm, plus post-theme highlight overrides

### 🌲 Explorer
+ [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — file & buffer browser
+ [s1n7ax/nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) — target-window selection

### 🌿 Git
+ [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — inline hunks & blame
+ [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) — `:LazyGit` in a floating terminal
+ [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) — `:DiffviewOpen` and file history

### ✏️ Editing & Motion
+ [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) · [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) · [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim) — paired-text editing
+ [fedepujol/move.nvim](https://github.com/fedepujol/move.nvim) · [hinell/duplicate.nvim](https://github.com/hinell/duplicate.nvim) · [Vonr/align.nvim](https://github.com/Vonr/align.nvim) — structural edits
+ [folke/flash.nvim](https://github.com/folke/flash.nvim) · [smoka7/hop.nvim](https://github.com/smoka7/hop.nvim) · [chrisgrieser/nvim-spider](https://github.com/chrisgrieser/nvim-spider) — navigation
+ [hungnguyen1503/nvim-vscode-search-replace](https://github.com/hungnguyen1503/nvim-vscode-search-replace) — VS Code-style search & replace (`<leader>S`)
+ [okuuva/auto-save.nvim](https://github.com/okuuva/auto-save.nvim) · [vidocqh/auto-indent.nvim](https://github.com/vidocqh/auto-indent.nvim) · [gbprod/stay-in-place.nvim](https://github.com/gbprod/stay-in-place.nvim) · [tzachar/highlight-undo.nvim](https://github.com/tzachar/highlight-undo.nvim) · [foosoft/vim-argwrap](https://github.com/foosoft/vim-argwrap) — quality of life
+ [Kicamon/markdown-table-mode.nvim](https://github.com/Kicamon/markdown-table-mode.nvim) · [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) — Markdown editing & preview

### 🔭 Fuzzy Finding
+ [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua) — files, grep, buffers, marks, commands, highlights — all through one `fzf` engine

### 🧭 Projects, Sessions & Tasks
+ [coffebar/neovim-project](https://github.com/coffebar/neovim-project) — project switching with auto-sessions
+ [Shatur/neovim-session-manager](https://github.com/Shatur/neovim-session-manager) — persistent sessions
+ [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm) — floating terminals
+ [stevearc/overseer.nvim](https://github.com/stevearc/overseer.nvim) — build & task runner

### 📋 Clipboard
+ [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim) — yank history, stored in [kkharji/sqlite.lua](https://github.com/kkharji/sqlite.lua)

### 🔤 Language Intelligence
+ [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — LSP client definitions
+ [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) + [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) — auto-installed tools
+ [saghen/blink.cmp](https://github.com/saghen/blink.cmp) — the only completion engine: LSP, path, snippet & buffer sources, Rust fuzzy matching
+ [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) — snippets
+ [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) — refined LSP UI
+ [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim) — symbol outline
+ [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) — LSP progress
+ [anuvyklack/windows.nvim](https://github.com/anuvyklack/windows.nvim) — auto window resize
+ [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) + [Bilal2453/luvit-meta](https://github.com/Bilal2453/luvit-meta) — Lua/Neovim development types

### 🌳 Treesitter & Syntax
+ [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — parser-based highlighting & textobjects
+ [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) — semantic motions
+ [RRethy/nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise) · [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) — language-aware closing constructs
+ [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) — nested delimiter colours

### 🖼 User Interface
+ [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) — start screen
+ [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) · [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) · [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — status, path & buffer bars
+ [matbme/JABS.nvim](https://github.com/matbme/JABS.nvim) — quick buffer switching
+ [folke/noice.nvim](https://github.com/folke/noice.nvim) + [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) — messages as floating UI
+ [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) — better `select_input`
+ [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) — smooth scrolling
+ [folke/trouble.nvim](https://github.com/folke/trouble.nvim) — diagnostics & quickfix list
+ [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) — project-wide search & replace
+ [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — searchable TODO highlights
+ [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate) · [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) · [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) — code readability
+ [ravibrock/spellwarn.nvim](https://github.com/ravibrock/spellwarn.nvim) — buffer-local spell warnings
+ [mrcjkb/nvim-lastplace](https://github.com/mrcjkb/nvim-lastplace) — reopen files where you left off

### 📦 Shared Dependencies
+ [folke/lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager · [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) — Lua utils
+ [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) · [grapp-dev/nui-components.nvim](https://github.com/grapp-dev/nui-components.nvim) — UI widgets
+ [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) — icons

# 🔤 Language Servers

Installed and updated automatically through **Mason**:

| Server | Languages |
|:---:|:---|
| `bashls` | Shell script |
| `clangd` | C / C++ (`--clang-tidy`, background index) |
| `cmake` | CMake |
| `jsonls` | JSON |
| `lua_ls` | Lua (with `lazydev` type library) |
| `pylsp` | Python |
| `vimls` | Vim script |
| `yamlls` | YAML |

# ⌨️ First Keys

Leader is <kbd>,</kbd>

| Keys | Action | Keys | Action |
|:---|:---|:---|:---|
| <kbd>,</kbd> <kbd>ch</kbd> | In-editor cheatsheet 🆘 | <kbd>,</kbd> <kbd>gg</kbd> | LazyGit |
| <kbd>,</kbd> <kbd>ff</kbd> | Find files | <kbd>,</kbd> <kbd>fw</kbd> | Live grep |
| <kbd>,</kbd> <kbd>fb</kbd> | Browse buffers | <kbd>,</kbd> <kbd>fa</kbd> | Find **all** files (incl. ignored) |
| <kbd>,</kbd> <kbd>fp</kbd> | Switch project | <kbd>,</kbd> <kbd>S</kbd> | VS Code-style search & replace |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd> | Select completion | <kbd>Enter</kbd> | Accept completion |
| <kbd>Ctrl-J</kbd> / <kbd>Ctrl-K</kbd> | Scroll viewport | <kbd>gc</kbd> | Comment (native) |

# ⚡ Performance

- 🎯 Every spec declares an `event` / `cmd` / `ft` / `keys` trigger; `VeryLazy` is reserved for plugins that startup code `require()`s synchronously
- 🧊 `vim.loader` bytecode cache + lazy.nvim module cache; unused runtime plugins (`gzip`, `zipPlugin`, `tarPlugin`, `tutor`, …) disabled
- 📂 File picker = `git ls-files` inside a repo (~0.5 s for 12k files), `fd` fallback outside
- 🐢 Huge generated files stay snappy: `vim-illuminate` skips buffers over 5000 lines

# 🧪 Validate

```powershell
./scripts/test-config.ps1
nvim --headless '+Lazy! sync' '+qall'
```

# 📄 License

[Apache-2.0](LICENSE) — made with ⚡ on Windows
