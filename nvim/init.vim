" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Install plugins with vim-plug https://github.com/junegunn/vim-plug
" Reload and runs :PlugInstall to install plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'slim-template/vim-slim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rails'

" Uncomment if you want to enable Github copilot plugin
Plug 'github/copilot.vim'

call plug#end()

" Use The Silver Searcher if available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" -- Configurations --

" Enable syntax highlighting
syntax on

" Don't wrap long lines
set nowrap

" Use 2 spaces for tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Set default colorscheme to solarized
set background=dark
silent! colorscheme solarized8_high

" Enable line numbers and don't make them any wider than necessary
set number numberwidth=2

" -- Mappings --

" Toggle NERDTreeToggle
nmap <Leader>g :NERDTreeToggle<CR>

" Switch between panes
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Mapping CtrlP command
nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
nnoremap <Leader>t :<C-U>CtrlP<CR>
