# Configuration Validation

Run commands from the repository root after changing Lua, plugin specifications, mappings, or Neovide settings.

## Fast checks

```powershell
nvim --version
.\scripts\test-config.ps1
.\scripts\test-config.ps1 -ProfileStartup
```

The first command confirms the executable selected by `PATH`. The script checks normal and file-open startup plus Neovim's deprecated API report. `-ProfileStartup` writes a startup profile under `%TEMP%`; keep median cold startup at or below one second across three runs.

## Interactive smoke test

Start `nvim`, open a representative source file, and run `:checkhealth`, `:Lazy`, and `:messages`. Exercise any changed mapping, command, completion, LSP, or debugger behavior. Confirm there are no startup errors or duplicate mappings.

For a Neovide-only change, also run:

```powershell
neovide --version
neovide
```

Verify the GUI starts, cursor and scrolling behavior remain usable, and terminal Neovim still starts without GUI-setting errors. Neovide must be tested interactively because it owns the graphical event loop.

## Before commit

Review `git diff --check` and `git status --short`. Do not commit an unintended `lazy-lock.json` update, generated plugin state, or a user's unrelated working-tree edits.
