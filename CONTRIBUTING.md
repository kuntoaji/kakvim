# Contributing to kakvim

Thank you for helping. This guide explains how the config is organized and what a pull request needs.

## Principles

- **Built-in first.** Use a Neovim 0.12 feature before you add a plugin.
- **Few plugins.** Every plugin must solve a daily problem for Rails developers.
- **Discoverable shortcuts.** Every shortcut has a description and a row in the Shortcut Guide.
- **Reproducible.** Plugins are pinned in `nvim/nvim-pack-lock.json`.

## Set up a development copy

Use `NVIM_APPNAME` so that your work does not touch your own config:

```sh
git clone https://github.com/<you>/kakvim.git ~/kakvim-dev
ln -s ~/kakvim-dev/nvim ~/.config/kakvim-dev
NVIM_APPNAME=kakvim-dev nvim
```

Install the tools from the README "Requirements" table, plus [StyLua](https://github.com/JohnnyMorganz/StyLua) (`brew install stylua`).

## Project layout

| Path | Contents |
| --- | --- |
| `nvim/init.lua` | Version check, Leader key, then loads the modules below in order |
| `nvim/lua/kakvim/options.lua` | Editor settings (`vim.opt`) |
| `nvim/lua/kakvim/autocmds.lua` | Autocommands. Put each one in the `kakvim` augroup |
| `nvim/lua/kakvim/plugins.lua` | `vim.pack.add()` and the setup of each plugin |
| `nvim/lua/kakvim/lsp.lua` | Language servers and diagnostics |
| `nvim/lua/kakvim/keymaps.lua` | Every custom shortcut |
| `nvim/nvim-pack-lock.json` | Exact plugin commits. Written by `vim.pack` |
| `docs/keymaps.md` | The Shortcut Guide for users |
| `scripts/check-keymaps.lua` | Checks that `keymaps.lua` and `docs/keymaps.md` agree |
| `scripts/smoke-test.sh` | Starts kakvim in a clean environment and fails on any error |

## Common changes

### Add or change a shortcut

1. Edit `nvim/lua/kakvim/keymaps.lua`. Give every mapping a `desc`.
2. Add or update the row in `docs/keymaps.md`. Use **kakvim** in the Source column.
3. If you add a new Leader group, add it to the which-key `spec` in `plugins.lua`.
4. Do not make a full mapping the prefix of another mapping. For example, `\g` toggles the tree, so Git keys use `\G`. Otherwise `\g` waits for the next key.

### Add a plugin

1. Explain in the pull request why a built-in feature is not enough.
2. Add the plugin to `vim.pack.add()` in `plugins.lua`, and its setup below.
3. Restart Neovim. `vim.pack` installs the plugin and updates `nvim/nvim-pack-lock.json`.
4. Commit the lockfile with your change.
5. Add the plugin to the README "Plugins" table.

### Update plugins

1. Run `:lua vim.pack.update()`, read the changes, and type `:write`.
2. Test the editor.
3. Commit `nvim/nvim-pack-lock.json` alone, with a message like `chore(deps): update plugins`.

## Test your change

Run these from the repository root before you open a pull request. CI runs the same checks.

```sh
# Format
stylua --check nvim/ scripts/

# Shortcuts and the Shortcut Guide agree
nvim --clean --headless -l scripts/check-keymaps.lua

# Neovim starts with no errors in a clean temporary environment
scripts/smoke-test.sh
```

Then test by hand: open a Rails project and use the shortcuts that your change touches.

## Commits and pull requests

- Open pull requests against `master`.
- Use [Conventional Commits](https://www.conventionalcommits.org): `feat:`, `fix:`, `docs:`, `chore:`, `ci:`. Mark breaking changes with `!`, for example `feat!: require Neovim 0.13`.
- Add an entry to `CHANGELOG.md` under "Unreleased".
- Keep each pull request to one topic.
