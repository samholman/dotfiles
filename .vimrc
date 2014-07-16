syntax on

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

if &diff
    colorscheme evening
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

