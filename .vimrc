"github.com/ericmanlol
"a lot of inspiration from various other .vimrc's
"

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


" Fuzzy Search {{{
"============================================================================
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'mileszs/ack.vim'

"}}}


"Code completion {{{
"============================================================================
"NeoBundle'Shougo/neocomplcache'
"NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'Shougo/neocomplete'

"}}}

" Snippets {{{
"============================================================================
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
" NeoBundle 'JazzCore/neocomplcache-ultisnips'

"}}}


" Marks {{{
"============================================================================
" NeoBundle 'kshenoy/vim-signature'

"}}}


" Comments
"============================================================================
NeoBundle 'scrooloose/nerdcommenter'


"}}}


" File browsing {{{
"============================================================================
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimfiler'

"}}}

" Syntax checker
"============================================================================
NeoBundle 'scrooloose/syntastic'

" Shell
"============================================================================
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimshell'
NeoBundle 'tpope/vim-dispatch'
"NeoBundle 'vim-scripts/Conque-Shell'



" File types {{{
"============================================================================
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

"}}}

"Git {{{
"============================================================================
NeoBundle "tpope/vim-fugitive"

"}}}

" Status line {{{
"============================================================================
NeoBundle 'bling/vim-airline' " So much faster than Powerline! :)
"NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"}}}

"color themes
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'

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
NeoBundle 'terryma/vim-smooth-scroll'
" testing
NeoBundle 'klen/python-mode.git'
"NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239


filetype plugin indent on
syntax enable

NeoBundleCheck


"General Settings {{{
"====================================================================
" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END


syntax on
set number


"This is specifically set because I went on a date with a pretty/elite C/systems-level coder-girl that laughed at me
"when I said that I use python and then told me she only uses cc=80.  #nostalgia -EM
set textwidth=80
set wrap
set whichwrap+=h,l,<,>,[,]

"set textwidth=80

"testing a +1 cc
"set cc=120

"256bit terminal
set t_Co=256

"alway show last status line
set laststatus=2


"spacing / indents
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set backspace=indent,eol,start
set autoindent
set nosmartindent
"set smartindent



set hlsearch

"case insensitive search
set ignorecase
set smartcase
"search improvement
set incsearch

"also hotkeyed to leader + 1
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

"allow change buffer without saving it first
set hidden

set title

"set visualbell


set nocompatible


"colorscheme Tomorrow-Night
"colorscheme jellybeans
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Explicitly set encoding to utf-8
set encoding=utf-8
set termencoding=utf-8



"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 
set cursorline






"Toggle line numbers and fold column for easy copying:
"nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪


" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup MyAutoCmd
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10



" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

"min lines to keep above and below cursor
set scrolloff=10

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"split to the right and below
set splitright
set splitbelow

"testing this for split height
set winheight=50

"regex
set magic

"show incomplete commands
set showcmd

" Column width indicator
set colorcolumn=+1


autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif

try
  lang en_us
catch
endtry


" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



"}}}



"Function Key Mappings {{{
"===============================================================================

" <F1>: Help
nmap <F1> [unite]h

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

" <F4>: Save session
nnoremap <F4> :<C-u>UniteSessionSave

"}}}





" Leader Key Mappings {{{
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

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.dotfiles/.vimrc<cr>

" <Leader>w: Close current buffer
nnoremap <Leader>w :bdelete<cr>

" <Leader>0: Run the visually selected code in python and replace it with the
" output
vnoremap <silent> <Leader>0 :!python<cr>


" <Leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>


" <Leader>f: Open Quickfix
nnoremap <silent> <Leader>f :botright copen<CR>

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>


"}}}


" Command-line Mode Key Mappings {{{
"===============================================================================

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>




"}}}


" Normal Mode Shift Key Mappings {{{
"===============================================================================

" Shift-Tab: NERDTree
nnoremap <S-Tab> :NERDTreeToggle<CR>

" Q: Closes the window
nnoremap Q :q<cr>

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" J: expand-region
map K <Plug>(expand_region_expand)

" K: shrink-region
map J <Plug>(expand_region_shrink)

" :: Remap to ,. After all the remapping, ; goes to command mode, . repeats
" fFtT, : repeats it backward, and , is the leader
"this is disabled and removed because I almost owned myself hard


"}}}

" Normal Mode Meta Key Mappings {{{
"===============================================================================

" Alt-a: Select all
nnoremap  :keepjumps normal ggVG<CR>


"alt+h go back to previous buffer
nnoremap <silent> h :bprevious<CR>

"}}}

" Fugitive{{{
"============================================================================

nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
" Quickly stage, commit, and push the current file. Useful for editing .vimrc
nnoremap <Leader>gg :Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr>

"}}}


" Airline{{{
"===============================================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


"}}}


" NERDTree {{{
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter * 
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"}}}



" Unite {{{
"===============================================================================

" Use the fuzzy matcher for everything

call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
      " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()

"  nmap <buffer> <ESC> <Plug>(unite_exit)
"  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_exit_insert)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  " Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif


"}}}



" Unite Sessions {{{
"===============================================================================

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Pop up session selection if no file is specified
" TODO: Why does this not work when Vim isn't run from tmux???!
autocmd MyAutoCmd VimEnter * call s:unite_session_on_enter()
function! s:unite_session_on_enter()
  if !argc() && !exists("g:start_session_from_cmdline")
    Unite -buffer-name=sessions session
  endif
endfunction

"}}}


" Autocommands {{{
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



"}}}


" VimShell {{{
"===============================================================================

let g:vimshell_prompt = "% "
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
  call vimshell#altercmd#define('g', 'git')
endfunction



"tmux trial for color issues and escape sequences
" Make Vim recognize xterm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"}}}

"smooth scroll trial via terryma
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>



" ScratchBuffer {{{
"===============================================================================

autocmd MyAutoCmd User PluginScratchInitializeAfter
\ call s:on_User_plugin_scratch_initialize_after()

function! s:on_User_plugin_scratch_initialize_after()
  map <buffer> <CR>  <Plug>(scratch-evaluate!)
endfunction
let g:scratch_show_command = 'hide buffer'

"}}}







" Instant Markdown {{{
"===============================================================================

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"}}}


" UltiSnips {{{
"===============================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"



" Make UltiSnips works nicely with YCM
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsListSnippets="<c-e>"

"}}}

" YCM {{{
"===============================================================================

let g:ycm_confirm_extra_conf = 0
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'unite' : 1
      \}

"}}}


