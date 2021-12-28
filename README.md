# kakvim

My Neovim configuration for Ruby (on Rails) development. I use this configuration for terminal in macOS and Ubuntu.

## Installation

1. Make sure [Neovim](https://neovim.io) and [vim-plug](https://github.com/junegunn/vim-plug) are installed.
2. Clone repository: `git clone git@github.com:kuntoaji/kakvim.git`
3. Copy Kakvim configuration from `.config/nvim/init.vim` to your Neovim init.vim or load with symlink, example command on Ubuntu: `ln -s ~/your/path/kakvim/.config/nvim/ ~/.config/nvim`
4. run `nvim` in terminal to open Neovim
5. run `:PlugInstall` to install all plugins
6. reload Neovim

## Plugins

* File system explorer - [preser/nerdtree](https://github.com/preservim/nerdtree)
* Code comment - [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim)
* Search from Vim - [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* Another Solarized theme for Vim - [lifepillar/vim-solarized8](https://github.com/lifepillar/vim-solarized8)
* Slim syntax highlighting for Vim - [slim-template/vim-slim](https://github.com/slim-template/vim-slim)
* Full path fuzzy file, buffer, mru, tag, ... finder for Vim - [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* Git - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* Completion with Tab - [ervandew/supertab](https://github.com/ervandew/supertab)
* Vim plugin for editing Ruby on Rails applications - [tpope/vim-rails](https://github.com/tpope/vim-rails)

## Mappings

| Keyword        | Mapping                        |
| -------------  | -------------                  |
| Leader         | \                              |
| NERDTreeToggle | \g                             |
| Switch Panes   | ctrl-h, ctrl-j, ctrl-k, ctrl-l |
| CtrlPBuffer    | \b                             |
| CtrlP          | \t                             |
