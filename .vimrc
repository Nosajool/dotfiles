set nocompatible   " Vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle
call vundle#begin() " initialize vundle
" Install Vundle plugins with
  " :source %
  " :PluginInstall
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'mattn/emmet-vim'

call vundle#end() " end vundle
filetype plugin indent on

syntax on          " turn on syntax highlighting
set number         " turn on line numbers
set expandtab      " insert space characters wherever the tab key is pressed
set tabstop=2      " 2 space characters when tab key is pressed
set shiftwidth=2   " 2 space characters for indentation >> <<
set softtabstop=2  " backspace treats 2 spaces as a tab and goes back 2 spaces
set autoindent     " use indent from previous line

" NERDTree use CTRL-N to toggle
map <C-n> :NERDTreeToggle<CR>

" Move up and down with k and j using display lines not real lines
" Move up and down with gk and gj using real lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
