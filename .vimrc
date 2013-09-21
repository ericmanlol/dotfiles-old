"disable vi compatibility
set nocompatible


if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }


"fuzzy search
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'mileszs/ack.vim'



"Code completion
"NeoBundle'Shougo/neocomplcache'
"NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Valloric/YouCompleteMe'

" Snippets
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
" NeoBundle 'JazzCore/neocomplcache-ultisnips'


" Marks
" NeoBundle 'kshenoy/vim-signature'

" Comments
NeoBundle 'scrooloose/nerdcommenter'




" File browsing
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimfiler'

" Syntax checker
NeoBundle 'scrooloose/syntastic'

" Shell
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimshell'
NeoBundle 'tpope/vim-dispatch'

" File types
" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim'} "HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'tpope/vim-markdown' "Markdown
NeoBundle 'terryma/vim-instant-markdown' "Markdown
NeoBundle 'vim-ruby/vim-ruby' "Ruby
NeoBundle 'tpope/vim-rails'
"NeoBundle 'psykidellic/vim-jekyll' "Jekyll
NeoBundle 'kchmck/vim-coffee-script' "CoffeeScript
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tsaleh/vim-matchit'

 
"Git
NeoBundle "tpope/vim-fugitive"

" Status line
NeoBundle 'bling/vim-airline' " So much faster than Powerline! :)
"NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"color themes
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Tags
" NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'

"misc
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-scratch'
NeoBundle 'vim-scripts/BufOnly.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'koron/nyancat-vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ton/vim-bufsurf'


"bundle install list
"Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
"Bundle 'davidhalter/jedi-vim'
"Bundle 'ervandew/supertab'
"Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}



filetype plugin indent on
syntax enable

NeoBundleCheck

"====================================================================
"General
"====================================================================
" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END


syntax on
set number


"This is specifically set because I went on a date with a pretty/elite C/systems-level coder-girl that laughed at me
"when I said that I use python and then told me she only uses cc=80.  #nostalgia -EM
set textwidth=120
set cc=120

"256bit terminal
set t_Co=256

"alway show last status line
set laststatus=2



set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set backspace=indent,eol,start
set incsearch
set smartindent
set textwidth=80
set hlsearch

"case insensitive search
set ignorecase
set smartcase

set paste

set noanti

set history=500


" Turn backup off
set nobackup
set nowritebackup
set noswapfile

"auto read when outside changes
set autoread

"show mode is unneeded due to airline/powerline
set noshowmode

set hidden

set title

"set visualbell

"set wildmenu

set nocompatible


colorscheme Tomorrow-Night

" Explicitly set encoding to utf-8
set encoding=utf-8


"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 
set cursorline




set linebreak


"Toggle line numbers and fold column for easy copying:
"nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR> 






"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","


" <Leader>``: Force quit all
nnoremap <Leader>`` :qa!<cr>

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>2: Toggle Tagbar
nnoremap <silent> <Leader>2 :TagbarToggle<cr>

" <Leader>tab: Toggles NERDTree
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p


"===============================================================================
" Fugitive
"===============================================================================

nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
" Quickly stage, commit, and push the current file. Useful for editing .vimrc
nnoremap <Leader>gg :Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr>


"Airline
"===============================================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"===============================================================================
" NERDTree
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter * 
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"===============================================================================
" Autocommands
"===============================================================================

" Turn on cursorline only on active window
" Cursorline makes things REALLY slow for me. Especially moving left and right
" on the same line when syntax highlight is on.
" http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown
augroup MyAutoCmd
  " autocmd WinLeave * setlocal nocursorline
  " autocmd WinEnter,BufRead * setlocal cursorline
augroup END

function! CursorPing()
    set cursorline cursorcolumn
    redraw
    sleep 200m
    set nocursorline nocursorcolumn
endfunction

" q quits in certain page types. Don't map esc, that interferes with mouse input
autocmd MyAutoCmd FileType help,quickrun
      \ if (!&modifiable || &ft==#'quickrun') |
      \ nnoremap <silent> <buffer> q :q<cr>|
      \ nnoremap <silent> <buffer> <esc><esc> :q<cr>|
      \ endif
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" json = javascript syntax highlight
autocmd MyAutoCmd FileType json setlocal syntax=javascript

" Enable omni completion
augroup MyAutoCmd
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  " autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
  autocmd FileType ruby let b:dispatch = 'rspec %'
augroup END

" Diff mode settings
" au MyAutoCmd FilterWritePre * if &diff | exe 'nnoremap <c-p> [c' | exe 'nnoremap <c-n> ]c' | endif


