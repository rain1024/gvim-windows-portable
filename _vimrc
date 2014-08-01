"Pathogen
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
endif

"hebrew
inoremap <f2> <c-o>:call ToggleHebrew()<cr>
noremap <f2> :call ToggleHebrew()<cr>

"hebrew keymap on
func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc

"only rl direction and latin keymap
" func! ToggleHebrew()
"   if &rl
"     set norl
"     set keymap=
"   else
"     set rl
"   end
" endfunc

"yank full file path to buffer
let @+=expand("%:p")

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)
"Hide mouse when typing
set mousehide

"Line ends charater
" set list 
set listchars=eol:~

"undofile use local history
set noundofile

"set folding method and marker
set fdm=marker
set foldmarker=[[,]]

"Working directly equals file directory
set autochdir

"copy directly to clipboard
set clipboard=unnamed

"copy directly to clipboard vi-mode
:set go+=a

"GUI stuff
"remove toolbar
set guioptions-=T  "remove toolbar

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set shiftround

"Typing area

"length
set lines=57
"columns
set columns=100

"scrolling offset
set scrolloff=15

"Backspace all line.
set backspace=indent,eol,start

"Display current cursor position in lower right corner.
set ruler

"Cursor line ruler
set cursorline

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping 
set wrap
set textwidth=60
set formatoptions=qrn1
set showbreak=>\


"Color column
set colorcolumn=80

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"
"Always show the status line
set laststatus=2

"Theme

"Set the color scheme. Change this to your preference. 
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
colorscheme wombat256mod 

"Set font type and size. Depends on the resolution. Larger screens, prefer h15
set guifont=Courier\ New:h10


"Backup

"Write the old file out when switching between files.
set autowrite

"Treat swapfiles
"no backup files
set nobackup
"only in case you don't want a backup file while editing
set nowritebackup
"no swap files
set noswapfile

"Switch between buffers without saving
set hidden


"Search

"Default flag for substitution
set gdefault
"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" "Switch on magic mode for regex
nnoremap / /\v
vnoremap / /\v

nnoremap ? ?\v
vnoremap ? ?\v

" case insensitive search
set ignorecase
set smartcase



"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeout
set timeoutlen=300
set ttimeoutlen=100


"Indent stuff
set smartindent
set autoindent
set linebreak
"Auto indent
autocmd BufRead, BufWritePre *.html normal gg=G


"Force encode
set fileencoding=utf-8
set encoding=utf-8

"Paragraphs

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip


"Enable code folding
set foldenable

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf


"Autocomplete
" Create dictionary for custom expansions
set dictionary+=.vim/dict.txt


" If non-zero, auto-popup is triggered by key mappings instead of
" |CursorMovedI| event. This is useful to avoid auto-popup by moving
" cursor in Insert mode.
let g:acp_mappingDriven = 1

"Splites

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Split windows below the current window.
set splitbelow              

"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

"Keymappings
"Want a different map leader than \
let mapleader = ","
"easymotion leader remapping
let g:EasyMotion_leader_key = '\'

"Map escape key to jj -- much faster
imap jj <esc>


"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Map a change directory to the desktop
nmap <leader>d :cd ~/Desktop<cr>:tabe.<cr>


"Change zen coding plugin expansion key to ctrl+z
let g:user_zen_expandabbr_key = '<c-z>'


"Commenting
"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Delete all buffers (via Derek Wyatt)
nmap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>


"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]




"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nnoremap <leader>nt :NERDTreeToggle<cr>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeCopyCmd= 'cp -r'

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


"JSBEAUTIFY
"js
autocmd FileType javascript noremap <buffer>  <leader>b :call g:Jsbeautify()<cr>

"SORROUND PLUGIN
"change inside parentheses
onoremap p i(


"Abreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

"launch current file in chrome
cnoreabbrev ch :!chrome  %:p <CR>
" fix indent
" by Brother Rain, April 2014
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
