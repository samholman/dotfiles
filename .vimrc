" Pathogen setup
execute pathogen#infect()
call pathogen#helptags()

" Airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Powerline fonts
let g:airline_powerline_fonts = 1

" CtrlP
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
" Open automatically if Vim started with no files
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open with Ctrl+N
map <C-n> :NERDTreeToggle<cr>

" Open tagbar with Ctrl+C
map <C-c> :TagbarToggle<cr>

" Ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Alias Ag to Ag! so it doesn't auto-open the first match
ca Ag Ag!

" Compatibility
set nocompatible
set backspace=2
set encoding=utf-8
" Use 256 colours plx
set t_Co=256

" Customise a few colours
set cursorline
set background=dark
colorscheme wombat256i
autocmd ColorScheme * hi LineNr      ctermbg=235 ctermfg=248
autocmd ColorScheme * hi CursorLine  ctermbg=234 cterm=NONE
autocmd ColorScheme * hi ColorColumn ctermbg=235

" Disable the default mode indicator (mode in statusline)
set noshowmode

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

" Syntastic checkers
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_javascript_checkers = ['eslint']

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

" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=psr2"
" Run codesniffer on save
let g:phpqa_codesniffer_autorun = 1
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" PHP CS Fixer configs
let g:php_cs_fixer_level = "psr2"

" Leader-cs fixes PHP codesniffer problems in the current file
nnoremap <silent><leader>cs :call PhpCsFixerFixFile()<CR>

" Default to unix formats/line endings
set fileformat=unix
set fileformats=unix,dos

" English (British) spelling please
set spelllang=en_gb

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

" Re-select after changing indentation in visual mode
vmap > >gv
vmap < <gv

" Jump out of insert mode with jj (which isn't ordinarily typed)
inoremap jj <esc>

" Cycle buffers with gb and gB
map gb :bn<cr>
map gB :bp<cr>

" Don't care if I typo when saving/quitting!
:command W w
:command Q q
:command WQ wq
:command Wq wq
:command Wa wa
:command Qa qa

" Allow saving files with sudo
command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Leader-s runs an Ag search for the word under cursor
nnoremap <leader>s :Ag! <c-r>=expand('<cword>')<cr><cr>

" Leader-\ switches windows
nnoremap <leader>\ <C-w>w

" Leader-z zooms in or out of current split
let s:zoomed=0
function! ToggleZoom()
    if (s:zoomed==1)
        :tabclose
        let s:zoomed=0
    else
        :tab split
        let s:zoomed=1
    endif
endfunction
nnoremap <leader>z :call ToggleZoom()<cr>

" Leader-r reloads vimrc
nnoremap <leader>r :so $MYVIMRC<cr>

" Leader-t runs the current file through a test runner via tmux (if appropriate)
function! RunTestFile()
    let l:filename = bufname("%")
    let l:filetype = &ft

    if (filetype == "php")
        let l:runner = "phpunit"
    elseif (filetype == "javascript")
        let l:runner = "mocha"
    endif

    if (exists("runner"))
        call VimuxRunCommand("clear; " . runner . " " . filename)
    else
        echo "No test runner for files of type: " . filetype
    endif
endfunction
nnoremap <leader>t :call RunTestFile()<cr>

" Leader-g executes the current file with Go (if appropriate)
function! RunGoFile()
    let l:filename = bufname("%")
    let l:filetype = &ft

    if (filetype == "go")
        call VimuxRunCommand("clear; go run " . filename)
    else
        echo "Not a Go file"
    endif
endfunction
nnoremap <leader>g :call RunGoFile()<cr>

" Reformat minified JS
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction
command! UnMinify call UnMinify()

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
nmap <C-S-H> :call <SID>SynStack()<cr>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

