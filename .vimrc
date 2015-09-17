set nocompatible   " Vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle
call vundle#begin() " initialize vundle
" Install Vundle plugins with
  " :source %
  " :PluginInstall
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

call vundle#end() " end vundle
syntax on          " enable syntax highlighting
filetype on        " enable filetype detection
filetype indent on " enable filetype-specific indenting
filetype plugin on " enable filetype-specific plugins

set number         " turn on line numbers
set expandtab      " insert space characters wherever the tab key is pressed
set tabstop=2      " 2 space characters when tab key is pressed
set shiftwidth=2   " 2 space characters for indentation >> <<
set softtabstop=2  " backspace treats 2 spaces as a tab and goes back 2 spaces
set autoindent     " use indent from previous line
set backspace=2    " fix backspacing on automatically indented text
set ruler          " show line and column number

" Move up and down with k and j using display lines not real lines
" Move up and down with gk and gj using real lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Set leader to space
let mapleader = "\<Space>"

" Scroll up/down
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" Window switching
nnoremap <Leader>l <C-w>l
nnoremap <Leader>L <C-w>L
nnoremap <Leader>h <C-w>h
nnoremap <Leader>H <C-w>H
nnoremap <Leader>j <C-w>j
nnoremap <Leader>J <C-w>J
nnoremap <Leader>k <C-w>k
nnoremap <Leader>K <C-w>K

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Git log<Cr>

" NERDTree use CTRL-N to toggle
map <C-n> :NERDTreeToggle<CR>

" vim-multiple-cursors use CTRL-D like sublime text
let g:multi_cursor_next_key='<C-d>'
