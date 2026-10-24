# kakvim

A small, fast Neovim configuration for Ruby on Rails development. It works in the terminal on macOS and Linux.

kakvim uses what Neovim 0.12 ships with: the built-in plugin manager (`vim.pack`), the built-in LSP client, built-in commenting and built-in completion. It adds only the plugins that a Rails developer needs every day.

## Features

- **Find anything**: fuzzy file search, project-wide text search and recent files (Telescope).
- **Rails navigation**: jump between model, controller, view and spec (vim-rails).
- **Code intelligence**: go to definition, references, rename and diagnostics for Ruby and ERB (ruby-lsp).
- **Syntax highlighting**: Treesitter for Ruby, ERB, HTML, CSS, JavaScript, YAML and JSON. Slim through vim-slim.
- **Git**: change signs in the gutter, hunk preview and stage (gitsigns), and a full Git interface (fugitive).
- **File tree**: nvim-tree, toggled with `\g`.
- **Shortcut hints**: press `\` and wait. A popup shows every shortcut (which-key).
- **Reproducible installs**: `nvim/nvim-pack-lock.json` pins every plugin to an exact commit.

## Requirements

| Tool | Why | Install (macOS) |
| --- | --- | --- |
| [Neovim](https://neovim.io) 0.12 or newer | The editor | `brew install neovim` |
| git | Downloads plugins | `xcode-select --install` |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Project-wide text search | `brew install ripgrep` |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) and a C compiler | Builds syntax parsers | `brew install tree-sitter-cli` |
| [ruby-lsp](https://shopify.github.io/ruby-lsp/) | Ruby code intelligence | `gem install ruby-lsp` |
| A [Nerd Font](https://www.nerdfonts.com) (optional) | File icons | `brew install --cask font-jetbrains-mono-nerd-font` |

On Linux, install the same tools with your package manager. Check that your distribution ships Neovim 0.12 or newer. If it does not, use the AppImage or tarball from the [Neovim releases page](https://github.com/neovim/neovim/releases). Install ruby-lsp with the same Ruby version that your project uses.

## Installation

1. Back up your current config, if you have one:

   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone the repository and link the `nvim` folder:

   ```sh
   git clone https://github.com/kuntoaji/kakvim.git ~/kakvim
   mkdir -p ~/.config
   ln -s ~/kakvim/nvim ~/.config/nvim
   ```

3. Start Neovim:

   ```sh
   nvim
   ```

   On the first start, kakvim downloads all plugins at the exact commits in `nvim-pack-lock.json`. Treesitter parsers build in the background. Restart Neovim when the downloads finish.

4. Run `:checkhealth vim.pack vim.lsp nvim-treesitter` and fix any errors.

### No plugin manager to install

kakvim uses `vim.pack`, the plugin manager built into Neovim 0.12. You do not download a plugin manager such as vim-plug, and you do not run an install command such as `:PlugInstall`. Use the steps above on every new machine.

| Step on a new machine | vim-plug | vim.pack (kakvim) |
| --- | --- | --- |
| Install the plugin manager | Download `plug.vim` by hand | Not needed. It ships with Neovim |
| Install plugins | Run `:PlugInstall` | Automatic on the first start |
| Plugin versions | The newest version on that day | The exact commits in `nvim-pack-lock.json` |

`vim.pack` installs only Neovim plugins. Install Neovim itself and the other tools in [Requirements](#requirements) on each machine.

To keep the same plugin versions on all your machines, commit and push `nvim/nvim-pack-lock.json` every time you add or update a plugin.

### Try kakvim without replacing your config

Neovim can keep several configs side by side with `NVIM_APPNAME`:

```sh
git clone https://github.com/kuntoaji/kakvim.git ~/kakvim
ln -s ~/kakvim/nvim ~/.config/kakvim
NVIM_APPNAME=kakvim nvim
```

### Enable file icons

If your terminal uses a Nerd Font, open `nvim/lua/kakvim/options.lua` and set:

```lua
vim.g.have_nerd_font = true
```

## Shortcuts

The Leader key is `\` (backslash). `\t` means: press `\`, then `t`.

| Keys | Action |
| --- | --- |
| `\t` | Find files |
| `\b` | Switch between open buffers |
| `\fg` | Search text in the project |
| `\g` | Open or close the file tree |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move between panes |
| `\ra` | Go to the alternate file (model to spec) |
| `gcc` | Comment or uncomment a line |
| `K` | Show documentation |
| `grr` / `grn` | List references / rename symbol |
| `\Gs` | Git status |

**Read the full [Shortcut Guide](docs/keymaps.md).** It lists every key, grouped by task, and explains how to add your own.

## Update

1. Pull the latest kakvim:

   ```sh
   cd ~/kakvim && git pull
   ```

2. In Neovim, install the plugin versions from the new lockfile:

   ```vim
   :lua vim.pack.update(nil, { target = 'lockfile' })
   ```

3. Read the list of changes. Type `:write` to apply them, or `:quit` to cancel.

To update all plugins to their newest versions, run `:lua vim.pack.update()`. This changes `nvim-pack-lock.json`.

## Migrate from the vim-plug version

The old kakvim (`init.vim`) used vim-plug. After you pull the Lua version:

1. Delete the old plugins and vim-plug:

   ```sh
   rm -rf ~/.local/share/nvim/plugged
   rm -f ~/.local/share/nvim/site/autoload/plug.vim
   ```

2. Install the new requirements from the table above.
3. Start Neovim. The new plugins install automatically.

What changed:

| Old | New |
| --- | --- |
| NERDTree | nvim-tree (`\g` still toggles it) |
| CtrlP (`\t`, `\b`) | Telescope (same keys) |
| ack.vim / `:Ag` | `\fg` (Telescope live grep) |
| tcomment (`gcc`) | Built-in commenting (same keys) |
| Supertab | Built-in completion. `<Tab>` still moves through the menu |

## Uninstall

```sh
rm ~/.config/nvim
rm -rf ~/.local/share/nvim/site/pack/core
mv ~/.config/nvim.bak ~/.config/nvim   # restore your old config
```

## Troubleshooting

| Problem | Fix |
| --- | --- |
| No syntax colors in Ruby files | Install the tree-sitter CLI, then run `:TSInstall ruby` |
| `\fg` finds nothing | Install ripgrep |
| `ruby-lsp` not found | Run `gem install ruby-lsp` with your project's Ruby version, and check that `ruby-lsp` is on your `PATH` |
| Boxes or question marks instead of icons | Set `vim.g.have_nerd_font = false`, or install a Nerd Font |
| Anything else | Run `:checkhealth` and read the errors |

## Plugins

| Plugin | Purpose |
| --- | --- |
| [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Color scheme |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Shortcut hints |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File tree |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Library for Telescope |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs and hunks |
| [tpope/vim-rails](https://github.com/tpope/vim-rails) | Rails navigation |
| [slim-template/vim-slim](https://github.com/slim-template/vim-slim) | Slim templates |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax parsers |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language server settings |

## Contributing

Bug reports, ideas and pull requests are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## License

[MIT](LICENSE)
