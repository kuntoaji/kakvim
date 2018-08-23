# kakvim
My Neovim configuration for Ruby (on Rails) development with VimR, Terminal in macOS and Terminal in Ubuntu

## Installation
1. Make sure [Neovim](https://neovim.io) and [vim-plug](https://github.com/junegunn/vim-plug) are installed.
2. Clone repository: `git clone git@github.com:kuntoaji/kakvim.git`
3. Load Kakvim with symlink: `ln -s ~/.config/nvim/ /yourpath/kakvim/.config/nvim`
4. run `nvim` in terminal to open Neovim
5. run `:PlugInstall` to install all plugins
6. reload Neovim

## Plugins
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim)
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* [lifepillar/vim-solarized8](https://github.com/lifepillar/vim-solarized8)
* [slim-template/vim-slim](https://github.com/slim-template/vim-slim)
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

## Mappings

| Keyword        | Mapping                        |
| -------------  | -------------                  |
| Leader         | \                              |
| NERDTreeToggle | \g                             |
| Switch Panes   | ctrl-h, ctrl-j, ctrl-k, ctrl-l |
| CtrlPBuffer    | \b                             |
| CtrlP          | \t                             |
