set nocompatible
set nobackup
set nowritebackup
set noswapfile
set showcmd
set number
set incsearch
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set ofu=syntaxcomplete#Complete

set splitbelow
set splitright
set ignorecase
set smartcase
set scrolloff=10
set nofoldenable
set clipboard=unnamed
set ruler
set backspace=2
set backspace=indent,eol,start
set whichwrap+=<
set autoread
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr    " Linebreak 
set tw=500 " Linebreak on 500 characters
set ai     " Auto indent
set si     " Smart indent
set wrap   " Wrap lines

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
set term=xterm-256color
try
	colorscheme solarized
catch
endtry

if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

set encoding=utf8
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

