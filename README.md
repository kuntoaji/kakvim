# kakvim: Neovim Configuration for Ruby (on Rails) Development

My highly-configured Neovim setup optimized for Ruby (on Rails) development, suitable for both terminal use on macOS and Linux.

## Features

* Includes a collection of essential plugins for productivity and convenience
* Offers a visually pleasing interface with the Solarized theme
* Supports Git integration with `vim-fugitive`
* Provides efficient code navigation and comment capabilities with `NERDTree` and `tcomment`
* Includes support for the Slim template language
* Provides powerful fuzzy file search with `CtrlP`
* Offers tab completion with `Supertab`
* Includes support for editing Ruby on Rails applications with `vim-rails`
* Offers fast, flexible search with `ack.vim`, including string pattern matching

## Installation

1. Ensure that you have [Neovim](https://neovim.io) installed on your system.
2. Install [vim-plug](https://github.com/junegunn/vim-plug).
3. Clone the repository: `git clone git@github.com:kuntoaji/kakvim.git`
4. Copy the Kakvim configuration file from `nvim/init.vim` to your Neovim `init.vim` or create a symlink with the command: `ln -s ~/your/path/kakvim/nvim/ ~/.config/nvim`
5. Open Neovim with the command nvim
6. Run `:PlugInstall` to install all plugins
7. Reload Neovim

## Included Plugins

* [preser/nerdtree](https://github.com/preservim/nerdtree) - File system explorer
* [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim) - Code comment
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim) - Search tool for Vim (requires ack to be installed on Mac): `brew install ack`
* [lifepillar/vim-solarized8](https://github.com/lifepillar/vim-solarized8) - Solarized theme for Vim
* [morhetz/gruvbox](https://github.com/morhetz/gruvbox) - Gruvbox as default colorscheme
* [slim-template/vim-slim](https://github.com/slim-template/vim-slim) - Slim syntax highlighting for Vim
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Full path fuzzy file, buffer, mru, tag finder for Vim
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration for Vim
* [ervandew/supertab](https://github.com/ervandew/supertab) - Tab completion
* [tpope/vim-rails](https://github.com/tpope/vim-rails) - Vim plugin for editing Ruby on Rails applications
* [github/copilot.vim](https://github.com/github/copilot.vim) - Vim/Neovim plugin for GitHub Copilot

## Key Mappings

The following custom mappings are available in kakvim:

| Keyword        | Mapping                        |
| -------------  | -------------                  |
| Leader         | \                              |
| NERDTreeToggle | \g                             |
| Switch Panes   | ctrl-h, ctrl-j, ctrl-k, ctrl-l |
| CtrlPBuffer    | \b                             |
| CtrlP          | \t                             |

## Font Configuration

This configuration uses [Fira Code Retina](https://github.com/tonsky/FiraCode) font with size 13 for Neovim GUI. If Fira Code Retina is not found, it
will fall back to `Monaco` font with size 13.
