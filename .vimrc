" Pathogen setup
execute pathogen#infect()
call pathogen#helptags()

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
" Open automatically if Vim started with no files
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Compatibility
set nocompatible
set encoding=utf-8
" Use 256 colours plx
set t_Co=256

" Customise a few colours
set cursorline
set background=dark
colorscheme wombat256i
autocmd ColorScheme * hi LineNr      ctermfg=255 ctermbg=236
autocmd ColorScheme * hi CursorLine  ctermbg=234 cterm=NONE
autocmd ColorScheme * hi ColorColumn ctermbg=238

" Highlight the 121st column (best-practice max line length)
if exists("+colorcolumn")
    set colorcolumn=121
endif

" Syntax highlighting
syntax on
" Detect filetypes and use correct indenting
filetype plugin indent on
" Autocompletion
set omnifunc=syntaxcomplete#Complete

" Highlight search matches whilst typing
set incsearch
" Ignore casing...
set ignorecase
" ... Unless typing an uppercase char
set smartcase
" Auto centre line when jumping between matches
map N Nzz
map n nzz

" Update the terminal title with filename
set title
" Show the statusbar
set laststatus=2

" Non-default filetypes
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.tache set filetype=html
" ... These for Cygwin (if having to use Windows)
au BufRead,BufNewFile *.phtml set filetype=html
au BufRead,BufNewFile *.php set filetype=php

" Default to unix formats/line endings
set fileformat=unix
set fileformats=unix,dos

" English (British) spelling please
set spell spelllang=en_gb

" Show line numbers
set number

" Auto-indenting and 4 spaces for tabs
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Round indentation to nearest multiple
set shiftround

" No line-wrapping
set nowrap

" Start scrolling before hitting the last line
set scrolloff=3
" Same for horizontal
set sidescrolloff=5
" Scroll horizontally by 1 character instead of a screen
set sidescroll=1
" Backspace over line endings
set backspace=indent,eol,start

" Jump out of insert mode with jj (which isn't ordinarily typed)
inoremap jj <esc>

" Don't care if I typo when saving/quitting!
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Leader-w switches windows
nnoremap <leader>w <C-w>w

" Write current session with F2
map <F2> :mksession! ~/.vim_session <cr>
" Load previous session with F3
map <F3> :source ~/.vim_session <cr>

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

" Show syntax highlighting groups for word under cursor
nmap <C-S-H> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

