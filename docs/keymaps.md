# kakvim Shortcut Guide

This guide lists every shortcut in kakvim, grouped by task. Learn the [Daily workflow](#2-daily-workflow) keys first. They cover most of a normal day.

## 1. How to read the keys

| Notation | Meaning |
| --- | --- |
| `\` | The Leader key. kakvim uses the backslash. `\t` means: press `\`, release it, then press `t`. |
| `\fg` | Press `\`, then `f`, then `g`, one after the other. |
| `<C-h>` | Hold `Ctrl` and press `h`. |
| `<S-Tab>` | Hold `Shift` and press `Tab`. |
| `]h` | Press `]`, then `h`. |
| Mode `n` | Normal mode (press `Esc` to get there). |
| Mode `i` | Insert mode (you are typing text). |
| Mode `x` | Visual mode (text is selected with `v` or `V`). |

The **Source** column tells you where a key comes from:

- **kakvim**: defined in [`nvim/lua/kakvim/keymaps.lua`](../nvim/lua/kakvim/keymaps.lua). You can change these.
- **built-in**: a default Neovim key. It works in any Neovim 0.12 setup.
- **plugin**: defined by a plugin inside its own window (for example, the file tree).

**Tip:** You do not need to memorize this page. Press `\` and wait half a second. A popup (which-key) shows every Leader key and what it does.

## 2. Daily workflow

### Find files and text

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `\t` | n | Find files by name (fuzzy) | kakvim |
| `\b` | n | Switch between open buffers | kakvim |
| `\fg` | n | Search text in the whole project (needs ripgrep) | kakvim |
| `\fw` | n | Search the word under the cursor in the project | kakvim |
| `\fr` | n | Open a recently used file | kakvim |
| `\fh` | n | Search Neovim help | kakvim |
| `\fk` | n | Search all shortcuts | kakvim |

Inside the finder popup:

| Keys | Action | Source |
| --- | --- | --- |
| `<C-n>` / `<C-p>` | Next / previous result | plugin |
| `<CR>` | Open the result | plugin |
| `<C-x>` / `<C-v>` | Open in a horizontal / vertical split | plugin |
| `<C-q>` | Send all results to the quickfix list | plugin |
| `<Esc>` | Close the finder | plugin |

### File tree

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `\g` | n | Open or close the file tree | kakvim |

Inside the file tree (press `g?` for the full list):

| Keys | Action | Source |
| --- | --- | --- |
| `<CR>` / `o` | Open the file or folder | plugin |
| `a` | Create a file. End the name with `/` to create a folder | plugin |
| `r` | Rename | plugin |
| `d` | Delete | plugin |
| `<C-v>` | Open in a vertical split | plugin |
| `g?` | Show all file tree keys | plugin |

### Windows (panes)

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `<C-h>` | n | Go to the left pane | kakvim |
| `<C-j>` | n | Go to the lower pane | kakvim |
| `<C-k>` | n | Go to the upper pane | kakvim |
| `<C-l>` | n | Go to the right pane | kakvim |
| `<C-w>v` | n | Split the window vertically | built-in |
| `<C-w>s` | n | Split the window horizontally | built-in |
| `<C-w>q` | n | Close the current pane | built-in |

### Edit and comment

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `gcc` | n | Comment or uncomment the current line | built-in |
| `gc` | x | Comment or uncomment the selection | built-in |
| `gcip` | n | Comment or uncomment the current paragraph | built-in |
| `<Tab>` | i | Next item in the completion menu | kakvim |
| `<S-Tab>` | i | Previous item in the completion menu | kakvim |
| `<C-y>` | i | Accept the selected completion item | built-in |
| `<C-e>` | i | Close the completion menu | built-in |
| `<Esc>` | n | Clear the search highlight | kakvim |

The completion menu opens by itself as you type. It suggests words from open buffers and, in Ruby files, results from ruby-lsp.

Trailing whitespace is removed automatically when you save a file.

## 3. Git

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `\Gs` | n | Git status (fugitive). Press `g?` inside for help | kakvim |
| `\Gb` | n | Git blame for the current file | kakvim |
| `]h` | n | Go to the next changed hunk | kakvim |
| `[h` | n | Go to the previous changed hunk | kakvim |
| `\hp` | n | Preview the hunk under the cursor | kakvim |
| `\hs` | n | Stage the hunk under the cursor | kakvim |
| `\hr` | n | Reset (discard) the hunk under the cursor | kakvim |

Inside the fugitive status window:

| Keys | Action | Source |
| --- | --- | --- |
| `s` / `u` | Stage / unstage the file under the cursor | plugin |
| `=` | Show the inline diff | plugin |
| `cc` | Commit | plugin |
| `g?` | Show all fugitive keys | plugin |

## 4. Rails

These keys use [vim-rails](https://github.com/tpope/vim-rails). They work inside a Rails project.

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `\ra` | n | Go to the alternate file (for example, model to spec) | kakvim |
| `\rr` | n | Go to the related file (for example, controller action to view) | kakvim |
| `gf` | n | Go to the file under the cursor (Rails-aware: partials, models, routes) | plugin |

Useful vim-rails commands: `:Emodel user`, `:Econtroller users`, `:Eview users/index`, `:Emigration`. Press `Tab` after the command to complete the name.

## 5. Code intelligence (LSP)

These keys work when a language server is attached. kakvim enables [ruby-lsp](https://shopify.github.io/ruby-lsp/) for Ruby and ERB files.

| Keys | Mode | Action | Source |
| --- | --- | --- | --- |
| `K` | n | Show documentation for the symbol under the cursor | built-in |
| `<C-]>` | n | Go to the definition | built-in |
| `grr` | n | List all references | built-in |
| `grn` | n | Rename the symbol | built-in |
| `gra` | n | Show code actions (quick fixes) | built-in |
| `gri` | n | Go to the implementation | built-in |
| `gO` | n | List the symbols in this file | built-in |
| `<C-s>` | i | Show the method signature | built-in |
| `]d` / `[d` | n | Go to the next / previous diagnostic | built-in |
| `<C-w>d` | n | Show the diagnostic under the cursor | built-in |
| `\x` | n | List all diagnostics in this file | kakvim |

## 6. Built-in Neovim keys worth knowing

| Keys | Mode | Action |
| --- | --- | --- |
| `u` / `<C-r>` | n | Undo / redo (undo history survives a restart) |
| `*` / `#` | n | Search the word under the cursor forward / backward |
| `<C-o>` / `<C-i>` | n | Jump back / forward in the jump history |
| `]q` / `[q` | n | Next / previous item in the quickfix list |
| `]b` / `[b` | n | Next / previous buffer |
| `.` | n | Repeat the last change |
| `:w` / `:q` | n | Save / quit |

## 7. Discover keys inside the editor

- Press `\` and wait. A popup shows every Leader key.
- Press `\fk` to search all shortcuts by name.
- Run `:map` to list every mapping, or `:verbose map \t` to see where one is defined.
- Run `:help` followed by a key, for example `:help gcc`.

## 8. Change or add a shortcut

1. Open [`nvim/lua/kakvim/keymaps.lua`](../nvim/lua/kakvim/keymaps.lua).
2. Add or edit a line. Always give a `desc`, because which-key shows it:

   ```lua
   map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Find diagnostics' })
   ```

3. Add a row to this guide in the right section, with **kakvim** as the source.
4. Run `nvim --headless -l scripts/check-keymaps.lua` from the repository root. The script fails when a `kakvim` row in this guide has no matching mapping, or when a mapping has no `desc`.
