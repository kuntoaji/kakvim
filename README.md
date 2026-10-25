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

Forgot a core Neovim command, such as a text object, a macro or search and replace? See the [Cheat Sheet](docs/cheatsheet.md).

## Example usage

This walkthrough follows a typical task in a Rails app: fix a bug in a model, check its spec, and commit. Each step lists the keys or commands to use.

### 1. Open a project, a folder or a file

```sh
cd ~/code/my_rails_app
nvim .                        # open the project. The file tree shows the folder
nvim app/models               # open a folder in the file tree
nvim app/models/user.rb       # open one file
nvim +42 app/models/user.rb   # open a file at line 42
```

### 2. Find the file you need

| Task | Keys or command |
| --- | --- |
| Open or close the file tree | `\g` |
| Open a file or folder in the tree | Move to it, then press `<CR>` |
| Create a file in the tree | `a`, type the name, press `<CR>` |
| Find a file by name | `\t`, type part of the name, such as `models/user` |
| Open a recent file | `\fr` |
| Find text in the whole project | `\fg`, then type the text |
| Open a Rails file by type | `:Emodel user`, `:Econtroller users`, `:Eview users/index` |

In any finder popup, press `<CR>` to open the result, or `<C-v>` to open it in a vertical split.

### 3. Move around and edit

| Task | Keys or command |
| --- | --- |
| Go to a line | `:42` |
| Search in the file | `/full_name`, then `n` for the next match |
| Change a word | `ciw`, type the new word, press `<Esc>` |
| Comment or uncomment a line | `gcc` |
| Complete a word or method | Start typing. Press `<Tab>` to choose, then `<C-y>` to accept |
| Undo / redo | `u` / `<C-r>` |
| Save | `:w` |

### 4. Understand the code (ruby-lsp)

| Task | Keys |
| --- | --- |
| Show documentation | `K` |
| Go to the definition | `<C-]>`. Press `<C-o>` to come back |
| List all references | `grr` |
| Rename a method everywhere | `grn` |
| Go to the next error or warning | `]d` |
| List all problems in the file | `\x` |

### 5. Jump between Rails files

| Task | Keys |
| --- | --- |
| Model to its spec, and back | `\ra` |
| Controller action to its view | `\rr` |
| Open the partial or model under the cursor | `gf` |
| Split the window and open the spec beside the model | `<C-w>v`, then `\ra` |
| Move between the panes | `<C-h>` / `<C-l>` |

### 6. Review and commit with Git

| Task | Keys |
| --- | --- |
| Go to the next changed block | `]h` |
| Preview the change | `\hp` |
| Undo a change you do not want | `\hr` |
| Open Git status | `\Gs` |
| Stage a file in the status window | Move to it, then press `s` |
| Commit | `cc`, write the message, then `:wq` |

### 7. Quit

| Task | Command |
| --- | --- |
| Close the current pane | `:q` |
| Save all files and quit | `:wqa` |
| Quit without saving | `:qa!` |

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
| `K`, `grr` or `<C-]>` do nothing in Ruby files | kakvim starts ruby-lsp only when it is on your `PATH`. Run `gem install ruby-lsp` with your project's Ruby version, then restart Neovim |
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
