# Neovim Cheat Sheet

Use this page as a quick reference when you forget a Neovim command or key. Every item works in plain Neovim 0.12, plus a few plugin commands that have no kakvim shortcut.

## How this page differs from the Shortcut Guide

| | [Shortcut Guide](keymaps.md) | Cheat Sheet (this page) |
| --- | --- | --- |
| Answers | "What does kakvim give me, and how do I change it?" | "How do I do this in Neovim again?" |
| Contents | Every kakvim shortcut, the keys inside the finder, file tree and Git windows, and the LSP keys | Core Vim editing: motions, text objects, registers, macros, search and replace, and `:` commands |
| Changes when | Somebody changes `keymaps.lua` (a script checks that the guide matches) | Rarely. These keys are part of Neovim |

The two pages do not repeat each other. If a key is in the Shortcut Guide, it is not on this page.

A few keys appear on both pages with different meanings, because plugin windows use their own keys. For example, `cc` changes a line in a normal buffer, but commits inside the fugitive window. This page always describes the key in a normal file buffer.

**Notation:** `<C-d>` means hold `Ctrl` and press `d`. `{motion}` means any motion from the "Move" table, for example `w` or `}`. A number before most keys repeats them: `3w` moves three words.

## Modes

| Keys | Action |
| --- | --- |
| `i` / `a` | Insert before / after the cursor |
| `I` / `A` | Insert at the start / end of the line |
| `o` / `O` | Open a new line below / above |
| `v` / `V` / `<C-v>` | Select characters / lines / a block |
| `R` | Replace mode: type over the text |
| `<Esc>` | Go back to normal mode |

## Move

| Keys | Action |
| --- | --- |
| `w` / `b` / `e` | Next word / previous word / end of word |
| `0` / `^` / `$` | Start of line / first character / end of line |
| `gg` / `G` / `:42` | First line / last line / line 42 |
| `{` / `}` | Previous / next paragraph |
| `%` | Jump to the matching bracket |
| `f{char}` / `t{char}` | Jump to / just before the next `{char}` on the line |
| `;` / `,` | Repeat the last `f` or `t` forward / backward |
| `<C-d>` / `<C-u>` | Scroll half a page down / up |
| `H` / `M` / `L` | Top / middle / bottom of the screen |
| `zz` / `zt` / `zb` | Scroll so that the cursor line is in the middle / top / bottom |
| `gd` | Go to the local definition of the word (no LSP needed) |
| `gx` | Open the URL or file path under the cursor in your default app |

## Edit

| Keys | Action |
| --- | --- |
| `x` | Delete the character under the cursor |
| `r{char}` | Replace one character |
| `dd` / `yy` / `cc` | Delete / copy / change the whole line |
| `D` / `C` | Delete / change to the end of the line |
| `d{motion}` / `y{motion}` / `c{motion}` | Delete / copy / change over a motion, for example `dw` or `y}` |
| `p` / `P` | Paste after / before the cursor |
| `J` | Join the next line to this line |
| `>>` / `<<` | Indent / unindent the line |
| `=` + `{motion}` | Reindent, for example `gg=G` for the whole file |
| `~` | Toggle the case of a character |
| `gu{motion}` / `gU{motion}` | Make lowercase / uppercase, for example `gUiw` |
| `<C-a>` / `<C-x>` | Add 1 to / subtract 1 from the number under the cursor |
| `xp` / `ddp` | Swap two characters / swap two lines |

## Text objects

Use a text object after `d`, `c`, `y`, `v` or `gu`. `i` means "inside", `a` means "around" (including the brackets, quotes or space).

| Keys | Selects |
| --- | --- |
| `iw` / `aw` | A word |
| `ip` / `ap` | A paragraph |
| `i"` / `a"` | Text in double quotes. Also `'` and `` ` `` |
| `i(` / `a(` | Text in parentheses. Also `[`, `{` and `<` |
| `it` / `at` | Text in an HTML or ERB tag |

Examples: `ciw` changes a word. `di"` deletes the text in quotes. `ya{` copies a block with its braces.

## Visual mode

| Keys | Action |
| --- | --- |
| `gv` | Select the last selection again |
| `o` | Move the cursor to the other end of the selection |
| `>` / `<` | Indent / unindent the selection |
| `I` / `A` in a block (`<C-v>`) | Insert / append text on every selected line |
| `:` | Run a command on the selected lines (Neovim types `'<,'>` for you) |

## Insert mode

| Keys | Action |
| --- | --- |
| `<C-w>` | Delete the word before the cursor |
| `<C-u>` | Delete to the start of the line |
| `<C-r>{reg}` | Paste a register, for example `<C-r>"` or `<C-r>+` |
| `<C-o>{cmd}` | Run one normal-mode command, then return to insert mode |

## Search and replace

| Command | Action |
| --- | --- |
| `/text` / `?text` | Search forward / backward |
| `n` / `N` | Next / previous match |
| `/text\c` | Search without matching case |
| `:%s/old/new/g` | Replace all matches in the file |
| `:%s/old/new/gc` | Replace with a confirmation for each match |
| `:s/old/new/g` | Replace on the current line (or the selection) |
| `:g/text/d` | Delete every line that contains `text` |
| `:v/text/d` | Delete every line that does not contain `text` |
| `:sort` / `:sort u` | Sort lines / sort and remove duplicate lines |

**Replace in the whole project:**

1. Search with `\fg`.
2. Press `<C-q>` to send the results to the quickfix list.
3. Run `:cdo s/old/new/g | update`.

## Registers and clipboard

| Keys | Action |
| --- | --- |
| `"+y` / `"+p` | Copy to / paste from the system clipboard |
| `"0p` | Paste the last copied text (not the last deleted text) |
| `"ay` / `"ap` | Copy into / paste from register `a` |
| `:reg` | Show all registers |

## Macros

| Keys | Action |
| --- | --- |
| `qa` | Start recording into register `a` |
| `q` | Stop recording |
| `@a` / `@@` | Play macro `a` / play the last macro again |
| `10@a` | Play macro `a` ten times |
| `:'<,'>norm @a` | Play macro `a` on every selected line |

## Marks

| Keys | Action |
| --- | --- |
| `ma` | Set mark `a` here. Use `A` to `Z` for a mark in another file |
| `'a` / `` `a `` | Jump to the line / exact position of mark `a` |
| `` `. `` | Jump to the last change |
| `''` | Jump back to the line before the last jump |

## Folds

| Keys | Action |
| --- | --- |
| `zf{motion}` | Create a fold, for example `zfap` |
| `za` | Open or close the fold under the cursor |
| `zR` / `zM` | Open / close all folds |

## Files, buffers, windows and tabs

| Command | Action |
| --- | --- |
| `:e path` | Open a file |
| `:e!` | Discard changes and reload the file |
| `:wa` / `:qa` / `:wqa` | Save all / quit all / save and quit all |
| `:q!` | Quit without saving |
| `:saveas path` | Save under a new name |
| `:ls` / `:b name` | List buffers / go to a buffer by part of its name |
| `:bd` | Close the current buffer |
| `:vsp path` / `:sp path` | Open a file in a vertical / horizontal split |
| `<C-w>o` | Close every other pane |
| `<C-w>=` | Make all panes the same size |
| `<C-w>T` | Move the pane to a new tab |
| `:tabnew` / `gt` / `gT` | New tab / next tab / previous tab |

## Quickfix and location lists

| Command | Action |
| --- | --- |
| `:copen` / `:cclose` | Open / close the quickfix list |
| `:lopen` / `:lclose` | Open / close the location list (`\x` fills it with diagnostics) |
| `:cdo {cmd}` | Run a command on every quickfix entry |

## Terminal

| Keys or command | Action |
| --- | --- |
| `:terminal` | Open a shell in the current pane. Press `i` to type |
| `<C-\><C-n>` | Leave terminal mode, back to normal mode |
| `:vsp \| terminal` | Open a shell in a vertical split |

## Spelling

| Keys or command | Action |
| --- | --- |
| `:set spell` / `:set nospell` | Turn spell checking on / off |
| `]s` / `[s` | Next / previous misspelled word |
| `z=` | Show suggestions for the word under the cursor |
| `zg` | Add the word to your dictionary |

## Git (commands without a kakvim shortcut)

| Command | Action |
| --- | --- |
| `:Git log --oneline` | Show the commit history |
| `:Gdiffsplit` | Compare the file with the last commit, side by side |
| `:Gwrite` | Stage the whole file (`git add`) |
| `:Gread` | Discard changes in the file (`git checkout`) |
| `:Git push` / `:Git pull` | Push / pull |
| `:Gitsigns blame_line` | Show who last changed the current line |
| `:Gitsigns toggle_current_line_blame` | Always show the blame for the current line |

## Rails (commands without a kakvim shortcut)

| Command | Action |
| --- | --- |
| `:Rails db:migrate` | Run a Rails or rake command |
| `:Generate model Post title:string` | Run a Rails generator and open the new file |

## LSP and diagnostics

| Command | Action |
| --- | --- |
| `:lua vim.lsp.buf.format()` | Format the file (ruby-lsp uses RuboCop when the project has it) |
| `:lsp restart` | Restart the language server |
| `:lsp stop` / `:lsp enable` | Stop / start the language server |
| `:checkhealth vim.lsp` | Show attached servers and errors |

## Settings you can toggle

| Command | Action |
| --- | --- |
| `:set wrap!` | Toggle line wrapping |
| `:set number!` / `:set relativenumber!` | Toggle line numbers / relative line numbers |
| `:set list!` | Show or hide tabs and trailing spaces |

## When something goes wrong

| Command | Action |
| --- | --- |
| `:messages` | Show recent messages and errors |
| `:checkhealth` | Check Neovim, plugins and tools |
| `:restart` | Restart Neovim and keep your session |
| `:Telescope` | List every Telescope picker (files, commands, highlights, and more) |
| `:verbose set tabstop?` | Show the value of a setting and which file set it |
