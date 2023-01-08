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

* [preser/nerdtree](https://github.com/preservim/nerdtree) - File system explorer
* [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim) - Code comment
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim) - Search from Vim, if you use Mac, you need install `ack` command first: `brew install ack`
* [lifepillar/vim-solarized8](https://github.com/lifepillar/vim-solarized8) - Another Solarized theme for Vim
* [slim-template/vim-slim](https://github.com/slim-template/vim-slim) - Slim syntax highlighting for Vim
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Full path fuzzy file, buffer, mru, tag, ... finder for Vim
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git
* [ervandew/supertab](https://github.com/ervandew/supertab) - Completion with Tab
* [tpope/vim-rails](https://github.com/tpope/vim-rails) - Vim plugin for editing Ruby on Rails applications
* [github/copilot.vim](https://github.com/github/copilot.vim) - Vim/Neovim plugin for GitHub Copilot, uncomment to enable this plugin

## Mappings

| Keyword        | Mapping                        |
| -------------  | -------------                  |
| Leader         | \                              |
| NERDTreeToggle | \g                             |
| Switch Panes   | ctrl-h, ctrl-j, ctrl-k, ctrl-l |
| CtrlPBuffer    | \b                             |
| CtrlP          | \t                             |
