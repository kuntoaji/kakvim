" Install plugins with vim-plug https://github.com/junegunn/vim-plug
" Reload and runs :PlugInstall to install plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

" Mappings

" Toggle NERDTreeToggle
nmap <leader>g :NERDTreeToggle<CR>

" Switch between panes
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" enable syntax highlighting
syntax on

" don't wrap long lines
set nowrap

" use 2 spaces for tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
