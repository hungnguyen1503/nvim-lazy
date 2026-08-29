# Neovim and Neovide Upgrades

Treat executable upgrades as compatibility work, not a routine lockfile refresh.

## Compatibility review

1. Capture the installed versions with `nvim --version` and `neovide --version`.
2. Read the target [Neovim release notes](https://github.com/neovim/neovim/releases), `:help news`, and migration or breaking-change notes.
3. Read the target [Neovide releases](https://github.com/neovide/neovide/releases) and search its open and closed issues for the target Neovim version and platform.
4. Check the upstream documentation and issues for plugins that use changed APIs, especially LSP, Treesitter, UI, and GUI integrations.
5. Write an upgrade plan naming target versions, expected config edits, test coverage, and how to reinstall the prior executables.

Do not infer compatibility from version numbers alone. Upstream release notes and issue reports are the source of truth for a candidate version.

## Staged execution

Upgrade Neovim first while keeping the current `lazy-lock.json`. Run the validation procedure and repair deprecated APIs. Then launch the current Neovide against the new Neovim and test its guarded settings. Upgrade Neovide only after that baseline works. Finally run `:Lazy sync` only if plugin updates are explicitly in scope, review the lockfile diff, and repeat validation. Remove archived plugins rather than retaining a second module cache or unsupported API shim.

Record the tested version pair and unresolved warnings in the change or pull request description. Commit messages in this repository use short imperative-style summaries such as `Update the keymap for nvim`.
