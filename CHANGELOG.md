# Changelog

All notable changes to kakvim are listed here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Breaking

- kakvim now needs Neovim 0.12 or newer.
- The config is now Lua (`nvim/init.lua`). `nvim/init.vim` is removed.
- vim-plug is replaced by the built-in `vim.pack`. See "Migrate from the vim-plug version" in the README.
- Plugins replaced:
  - NERDTree -> nvim-tree.lua
  - CtrlP and ack.vim -> Telescope
  - tcomment_vim -> built-in `gc` commenting
  - Supertab -> built-in completion
  - morhetz/gruvbox and vim-solarized8 -> gruvbox.nvim

### Added

- ruby-lsp through the built-in LSP client.
- Treesitter highlighting and indentation.
- gitsigns.nvim for Git hunks, and which-key.nvim for shortcut hints.
- New shortcuts for search, Git, Rails and diagnostics. See `docs/keymaps.md`.
- `docs/cheatsheet.md`: a quick reference for core Neovim commands and keys.
- `nvim-pack-lock.json` pins every plugin to an exact commit.
- MIT license, contributing guide, issue and pull request templates, and CI.

### Fixed

- Saving a file no longer moves the cursor when trailing whitespace is removed.
- The trailing-whitespace autocommand no longer runs twice after the config is reloaded.
- Opening a Ruby file no longer shows a spawn error when ruby-lsp is not installed. kakvim now starts ruby-lsp only when it is on `PATH`.

### Removed

- The GUI font setting. It never ran in terminal Neovim. Set the font in your terminal instead.
