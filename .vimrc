" Pathogen
execute pathogen#infect()
call pathogen#helptags()

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

set nocompatible

" Colourscheme
set cursorline
hi LineNr     ctermfg=255 ctermbg=236
hi CursorLine ctermbg=234 cterm=NONE

if &diff
    colorscheme evening
endif

syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set laststatus=2

au BufRead,BufNewFile *.md set filetype=markdown
set spell spelllang=en_gb

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

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

