set nocompatible   " Vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle
call vundle#begin()               " initialize vundle
" Install Vundle plugins
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
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'

call vundle#end()  " end vundle
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
set incsearch      " show search results as you type
set ignorecase     " ignore search case
set splitbelow     " splits below by default
set splitright     " split right by default
set autoread       " when file change by :! cmd, reload file. Alternatively, :e
set autowrite      " save on focus loss

set title          " show file title
set showcmd        " show typed letters in bottom right
set showmode       " show mode in bottom left corner

" allow use of mouse
set ttyfast
set mouse=a
set ttymouse=xterm2

" Normal + Visual mode
" Move up and down with k and j using display lines not real lines
" Move up and down with gk and gj using real lines
" Move to begin/end of line with H/L
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap H ^
noremap L g_

" Set leader to space
let mapleader = "\<Space>"

" Scroll up/down by half a page
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

" Window Resizing - <C-w> re-balances
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" Relative number toggling
nnoremap <Leader>n :set relativenumber!<CR>

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Git log<CR>

"Open Vimrc
nnoremap <Leader>rc :vsp $MYVIMRC<CR>

" NERDTree use CTRL-N to toggle
map <C-n> :NERDTreeToggle<CR>

" vim-multiple-cursors use CTRL-D like sublime text
let g:multi_cursor_next_key='<C-d>'

" Set Vimwiki file type for *.wiki
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" Use Calendar within VimWiki
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <Leader>c :call ToggleCalendar()<CR>

" Make quick note
:autocmd FileType vimwiki map <Leader>d :VimwikiMakeDiaryNote<CR>

" Generate Links
:autocmd FileType vimwiki map <Leader>wg :VimwikiGenerateLinks<CR>
