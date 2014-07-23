" Pathogen
execute pathogen#infect()
call pathogen#helptags()

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

set nocompatible
set encoding=utf-8

" Colourscheme
set cursorline
hi LineNr     ctermfg=255 ctermbg=236
hi CursorLine ctermbg=234 cterm=NONE

if exists("+colorcolumn")
    set colorcolumn=81
endif

if &diff
    colorscheme evening
endif

syntax on
set t_Co=256
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set incsearch
set ignorecase
set smartcase
map N Nzz
map n nzz

set title
set laststatus=2

au BufRead,BufNewFile *.md set filetype=markdown
set spell spelllang=en_gb

set number
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set nowrap

set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set backspace=indent,eol,start

inoremap jj <esc>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Trim trailing whitespace on save
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

