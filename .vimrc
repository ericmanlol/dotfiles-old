set textwidth=120
set expandtab
syn on
set number
set autoindent
set softtabstop=4
set smarttab
set backspace=indent,eol,start
set incsearch
set smartindent

set hlsearch

set ignorecase

set smartcase

set paste

set noanti

set history=50

set hidden

set title

"set visualbell

"set wildmenu

set nocompatible

set t_Co=256

colorscheme lucius

nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 
set laststatus=2 
set cursorline
"set cursorcolumn 

"wtf does this do again?
"imap ,t <Esc>:tabnew<CR>

"Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR> 


" Execute file being edited with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR> 



"map <F12> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 




