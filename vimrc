set nocompatible
"set nobackup
"set nowritebackup
"set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set showcmd
set number
set incsearch
set hlsearch
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set ofu=syntaxcomplete#Complete
set history=1000
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
set lbr      " Linebreak
set tw=500   " Linebreak on 500 characters
set ai       " Auto indent
set si       " Smart indent
set cindent  " Like smartindent, but stricter and more customisable
set wrap lbr " Wrap lines
set encoding=utf8
set ffs=unix,dos,mac
set whichwrap+=<,>,[,]
setlocal spell spelllang=en_us

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","

" open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tsaleh/vim-supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
" Plugin 'tpope/vim-cucumber'
Plugin 'yaml.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'vim-emblem'
Plugin 'oscarh/vimerl'
Plugin 'elixir-lang/vim-elixir'
" Plugin 'vim-scripts/VimClojure'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wincent/command-t'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
call vundle#end()

" Enable filetype plugins
if has ("autocmd")
    " File type detection. Indent based on filetype. Recommended.
    filetype plugin indent on
endif

syntax on
set omnifunc=syntaxcomplete#Complete
set term=xterm-256color
let g:solarized_termtrans=1
let g:solarized_termcolors=256

" Perl
" - syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1
" - includes POD
let perl_include_pod = 1


" GUI
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set background=light
    try
        colorscheme solarized
    catch
    endtry
else
    set background=dark
    try
        colorscheme solarized
        set mouse=a
    catch
    endtry
endif

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Double slash -> Case insensitive search
map // /\c
map ?? ?\c

" text search tuning
nnoremap <silent> <leader>h :set hlsearch!<CR>
nnoremap <silent> <leader>r :exe "CtrlPClearCache"<CR>
nnoremap <silent> <leader>b :exe "CtrlPBuffer"<CR>
nnoremap <leader>gg yiwmG/<C-R>"<CR>:Ggrep <C-R>"<CR>:set hlsearch<CR>
vnoremap <leader>gg ymG/<C-R>"<CR>:Ggrep <C-R>"<CR>:set hlsearch<CR>

" Ctrl+P file search options
let g:ctrlp_map = '<leader>f'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {'dir': '\v[\/](\.(git|svn|hg|DS_Store|so|bundle|zip)|_build)$'}

" code editing helpers
let g:vim_json_syntax_conceal = 0
let g:syntastic_mode_map={ 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html'] }

" indent
function! Indent()
    let p = getpos(".")
    normal! gg=G
    call setpos(".",p)
endfunction
nnoremap <silent> <leader>i :call Indent()<CR>

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" strip trailing whitespaces before writing buffer
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

" custom settings for specific file types
augroup custom
    au!
    au BufWritePre * call StripTrailingWhite()
    au FileType javascript,json,html,eruby setl sw=4 sts=4 et
    au FileType ruby,haml,yaml,coffee,scss,sass,slim setl sw=2 sts=2 et
    au FileType erlang setl ts=8 sw=4 sts=4 noet commentstring=%\ %s
    au Filetype elixir nnoremap <leader>s :exe "Start mix test ".@%."; read"<CR>
    au Filetype ruby nnoremap <leader>s :exe "Start bundle exec rspec ".@%.":".line(".")."; read"<CR>
    au Filetype ruby nnoremap <leader>as :exe "Start bundle exec rspec ".@%."; read"<CR>
    autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction
