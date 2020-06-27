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
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'vimwiki/vimwiki'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-repeat'
Plugin 'fatih/vim-go'
Plugin 'flxf/ucpp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()  " end vundle
syntax on          " enable syntax highlighting
filetype on        " enable filetype detection
filetype indent on " enable filetype-specific indenting
filetype plugin on " enable filetype-specific plugins

let g:solarized_termcolors = 256
set background=dark
" set background=light
colorscheme solarized
set encoding=utf-8

set number         " turn on line numbers
set expandtab      " insert space characters wherever the tab key is pressed
set tabstop=2      " 2 space characters when tab key is pressed
set shiftwidth=2   " 2 space characters for indentation >> <<
set softtabstop=2  " backspace treats 2 spaces as a tab and goes back 2 spaces
set autoindent     " use indent from previous line
set backspace=2    " fix backspacing on automatically indented text
set ruler          " show line and column number
set ignorecase     " ignore search case (lowercase)
set smartcase      " override 'ignorecase' if search pattern contains upper case characters
set incsearch      " show search results as you type
set showmatch      " when closing bracket is inserted, briefly jump to the matching one
set splitbelow     " splits below by default
set splitright     " split right by default
set autoread       " when file change by :! cmd, reload file. Alternatively, :e
set autowrite      " save on focus loss
set textwidth=120   " maximum width of text that is being inserted
set colorcolumn=+1 " mark the 120th column
set cursorline     " Highlight the screen line of the cursor
set relativenumber " Start with relative number turned on
set cursorline cursorcolumn " Verticle column highlighting
set noswapfile     " no swap file"
set title          " show file title
set showcmd        " show typed letters in bottom right
set showmode       " show mode in bottom left corner
set wildmenu       " command-line completion
set wildmode=full  " complete the next full match
set scrolloff=3    " Minimal number of screen lines to keep above and below the cursor
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.o,*.d,*.crf "Ignore files when completing file/directory names

" allow use of mouse
set ttyfast        " Indicate fast termianl connection
set mouse=a        " Enable use of mouse in normal, visual, insert, command mode
set ttymouse=xterm2 " Name of the terminal type for which mouse codes are to be recognized

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

" Indenting
nnoremap <Leader>[ <<
nnoremap <Leader>] >>

" Jump to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" Copy to OSX clipboard
vnoremap <Leader>c "*y

" Paste from OSX clipboard
nnoremap <Leader>v "*p

" Exit insert mode using jj
imap jj <ESC>

" Jump to mark
nnoremap M `

" Make ; the same as : in normal mode
nnoremap ; :

" Relative number toggling
nnoremap <Leader>n :set relativenumber!<CR>

" Paste toggling
nnoremap <Leader>p :set invpaste<CR>

" Visually select all
nnoremap <Leader>a ggVG

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Git log<CR>

" Expand emmet using ,, in insert mode
" let g:user_emmet_leader_key=',' Determine a different key. default , is important

" Open Vimrc
nnoremap <Leader>rc :vsp $MYVIMRC<CR>

" Open tmux config
nnoremap <Leader>tc :vsp ~/.tmux.conf<CR>

" NERDTree use CTRL-N to toggle
map <C-n> :NERDTreeToggle<CR>

" Ignore certain file extensions in NerdTree
let NERDTreeIgnore = ['\.pyc$','\.class$', '\.o$', '\.d$']

" View current buffer in NERDTree
map <Leader>f :NERDTreeFind<CR>

" CtrlP
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" close current buffer
nmap <Leader>q :bp <BAR> bd #<CR>

" vim-multiple-cursors use CTRL-D like sublime text
let g:multi_cursor_next_key='<C-d>'

" Vimwiki Settings
autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki " Set vimwiki filetype
function! ToggleCalendar() " Use Calendar within VimWiki
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
autocmd FileType vimwiki map <Leader>c :call ToggleCalendar()<CR> " Toggle vimwiki calendar
autocmd FileType vimwiki map <Leader>gl :VimwikiGenerateLinks<CR> " Generate vimwiki index links
autocmd FileType vimwiki map <Leader>wn :VimwikiDiaryNextDay<CR> " Next Day
autocmd FileType vimwiki map <Leader>wp :VimwikiDiaryPrevDay<CR> " Previous Day

" --------------------------- Language Specific Stuff ----------------------

" Markdown/Latex Specific
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown,tex set spell " Spell check on
autocmd FileType markdown,tex set textwidth=0 " max text width disabled

" Git Commit Specific
autocmd FileType gitcommit set textwidth=72 " Commit message width

" C
" Might not be worth it to set these because it makes file switching significantly slower
" autocmd FileType c set tabstop=4
" autocmd FileType c set softtabstop=4
" autocmd FileType c set shiftwidth=4
" autocmd FileType c map<Leader>hm :%s//\r/g<CR> " Remove windows line endings*
autocmd BufRead,BufNewFile *.cc set filetype=cpp.ucpp " Set ucpp filetype NOTE TEMP

" Java
autocmd FileType java set tabstop=4
autocmd FileType java set softtabstop=4
autocmd FileType java set shiftwidth=4
autocmd FileType java set noexpandtab

" Go
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1


" Javascript
" React
let g:jsx_ext_required = 0

" --------------------------- Airline----------------------
" Always give the last window the status line
set laststatus=2
" Enable the automatic population of g:airline_symbols dictionary
let g:airline_powerline_fonts = 1
" Enable the enhanced tabline
let g:airline#extensions#tabline#enabled = 1
" Display buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1
" Only show the filename in buffer tab
let g:airline#extensions#tabline#fnamemod = ':t'
" Theme
let g:airline_theme='lucius'
" Display buffer number in tabline and allow switching to with leader#
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
