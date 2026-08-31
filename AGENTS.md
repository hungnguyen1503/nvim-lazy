# Repository Guidelines

## Project Overview

This is a personal Neovim configuration, not a work/firmware repository. It bootstraps `lazy.nvim`, defines Lua-based editor behavior and plugin specifications, and includes guarded settings for the Neovide GUI. Plugins are fetched from GitHub through `lazy.nvim`.

## Nvim configuration

Put editor settings, commands, mappings, and autocmds in `lua/config/`. Add Lazy specifications to the matching `lua/plugins/<domain>.lua`; reusable setup functions remain in `lua/plugins/setup/`. After every configuration change, run `./scripts/test-config.ps1`, then start `nvim` and check `:checkhealth`. Use [validation.md](.agents/docs/validation.md) for the full verification sequence.

## Version nvim control

Before upgrading Neovim or Neovide, inspect the target releases, migration notes, and open compatibility issues in their upstream GitHub repositories. Record the current and target versions, affected APIs/plugins, rollback method, and validation results in the change plan; do not upgrade either executable and the lockfile together without that plan. Follow [upgrades.md](.agents/docs/upgrades.md).

## Key Constraints

- Do not edit `lazy-lock.json` by hand; let `:Lazy sync` generate it.
- Do not remove the `vim.g.neovide` guards or apply GUI-only settings to terminal Neovim.
- Do not assume a plugin supports the installed Neovim version; check its upstream documentation first.
- Preserve user changes outside the requested scope, especially configuration files already modified in the working tree.
- Keep plugin specs lazy by default; add an explicit event, command, filetype, or key trigger for every standalone plugin.

## Additional documentation

- [Configuration architecture](.agents/docs/architecture.md): load order, module ownership, and plugin layout.
- [Plugin catalog](.agents/docs/plugin-catalog.md): category, purpose, and ownership for every active plugin.
- [Validation](.agents/docs/validation.md): headless checks and interactive smoke tests.
- [Neovim and Neovide upgrades](.agents/docs/upgrades.md): compatibility review and staged upgrade plan.
