" plugins
" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'haya14busa/incsearch.vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'rickhowe/diffchar.vim'

call vundle#end()

" plugin settings
" theme
colorscheme seoul256

" nerdtree
nmap <silent> <leader>r :NERDTreeTabsToggle<CR>

" syntastic
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = "W"

" tags
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose=2

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 200000

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" general settings
" filetype detetion
filetype plugin indent on

" cscope
source ~/.vim/plugin/cscope_maps.vim
set nocscopeverbose

" fzf
set rtp+=~/.fzf

" spaces over tabs
set tabstop=2 shiftwidth=2 expandtab

" line numbers
set number

" line length marker
set colorcolumn=80

" syntax
syntax on

" show commands
set showcmd

" indentation
set autoindent
set smartindent

" splits
autocmd VimResized * wincmd =
nnoremap <C-w>_ :split<CR>
nnoremap <C-w>\| :vsplit<CR>

" current buffer diff
command DiffOriginal w !diff % -

" clipboard access, needs +clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
