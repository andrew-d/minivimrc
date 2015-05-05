" Use Vim settings, rather than Vi settings (must be first!)
set nocompatible

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Enable line numbers
set number

" Keep the cursor this many lines from the top/bottom of the window
set scrolloff=8

" Remove annoying ~file and swap files
set nobackup noswapfile

" No fancy visual bell
set visualbell t_vb=""

" Show matching brackets
set showmatch

" Show incomplete command at bottom right
set showcmd

" Suppress various messages
set shortmess=filrwxtI

" Save 1000 lines of history
set history=1000

" Ignore case when the search string is lower-case, be case-sensitive otherwise
set ignorecase smartcase

" Highlight search results
set hlsearch

" Slightly highlight the current line
set cursorline

" Set up our status line
if has('statusline')
    set laststatus=2
    let &statusline='[%n] %<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V   %P%)'
endif

" Use the "desert" colorscheme with a dark background by default, but use the
" wombat or solarized schemes if we have them.
colorscheme desert
set background=dark
silent! colorscheme wombat256mod
silent! colorscheme solarized

" Space will unhighlight search and clear any diplayed message
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR><Space>

" Set Leader variable
let mapleader = "\\"

" Mapping: Fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>

" Mapping: New vertical window
nmap <Leader>v :rightbelow vnew<CR>

" The following mappings make Ctrl+navkey move that direction in windows
" We set them in both normal and insert mode, for ease of use
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h
inoremap <C-j> <ESC><C-W>j
inoremap <C-k> <ESC><C-W>k
inoremap <C-l> <ESC><C-W>l
inoremap <C-h> <ESC><C-W>h

" Pressing F2 will toggle and show the paste value (even in insert mode)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab autoindent

" If it exists, include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
