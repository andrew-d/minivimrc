" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Enable line numbers
set number

" Always show current position
set ruler

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

" Suppress "Press ENTER..." prompt
set shortmess=filrwxtI

" Save 1000 lines of history
set history=1000

" By default, ignore case when searching
set ignorecase

" When the search pattern contains upper-case characters, be case-sensitive again
set smartcase

" Highlight search results
set hlsearch

" Slightly highlight the current line
set cursorline

" Set the ruler format.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Set up our status line.
if has('statusline')
    set laststatus=2
    let &statusline='[%n] %<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V   %P%)'
endif

function! HasPaste()
    if &paste
        return '[PASTE]  '
    else
        return ''
    endif
endfunction

" Use the "desert" colorscheme with a dark background
colorscheme desert
set background=dark

" If we have it, enable the 'wombat' color scheme
silent! colorscheme wombat256mod

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

" Pressing F2 will toggle and show the paste value
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>                    " F2 should toggle in insert mode too

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" If it exists, include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
