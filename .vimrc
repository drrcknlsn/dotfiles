runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

runtime macros/matchit.vim

set nocompatible

" Disable arrow keys to break the habit and reinforce hjkl navigation
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

set t_Co=256

syntax on
set background=dark
colorscheme apprentice
highlight IncSearch ctermbg=229
highlight MatchParen ctermbg=black ctermfg=white
set cul

" Set character encoding to UTF-8 with no BOM
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set nobomb

set fileformat=unix
set fileformats=unix,mac,dos

filetype on
filetype plugin on
filetype indent on

" Keeps at least 5 lines between the cursor and edge of screen
set scrolloff=5

" Shows line/column info on the toolbar
set ruler

" Shows line numbers
"set number

" Highlight the line/column of the cursor
set cursorline
set cursorcolumn

" Show status bar
set laststatus=2

set hlsearch   " Highlight searches
set incsearch  " Incremental search (search as you type)
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type an uppercase letter

" Show matching parentheses
set showmatch
set mat=2

set expandtab
set smarttab

set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set cindent " ?

" Add indentation shortcuts
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Display whitespace and special characters
set list
" eol:¬
set listchars=tab:→\ ,trail:·,nbsp:·,extends:…,precedes:…

" Highlight eol/extends/precedes
highlight NonText ctermfg=black

" Highlight unwanted whitespace
highlight SpecialKey ctermbg=black ctermfg=red

" Remove unwanted whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\n\{3,}/\r\r/e
autocmd BufWritePre * retab

" Don't wrap long lines
"set nowrap

" Don't use backups
set nobackup
set nowritebackup
set noswapfile

" Map paste mode, which disables auto-indentation and such
set pastetoggle=[12~

autocmd BufNewFile,BufRead .jscsrc set ft=json
autocmd BufNewFile,BufRead .jshintrc set ft=json

autocmd BufNewFile,BufRead *.phtml set ft=php sw=2 ts=2

autocmd FileType php set sw=4 ts=4

autocmd BufNewFile *.html 0r ~/.vim/skeleton.html | normal Gdd
autocmd BufNewFile *.php 0r ~/.vim/skeleton.php | normal Gdd
autocmd BufNewFile *.xml 0r ~/.vim/skeleton.xml | normal Gdd

let g:closetag_html_style=1

" Tab characters use error highlighting
"match ErrorMsg /\t\+/

" Long lines use error highlighting
"match WarningMsg /\%<121v.\%>80v/
match ErrorMsg /\%>120v.\+/
"2345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
"                                                                              ^                                       ^
"                                                                             80                                     120

"""""""""""""""
"             "
"  Lightline  "
"             "
"""""""""""""""

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['filename']],
    \   'right': [['syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
    \ }
    \ }

" The NERD Tree

"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd r
"autocmd vimenter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"highlight Directory ctermfg=blue

"function! NERDTreeHighlightFile(extension, fg, bg)
" exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
" exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none')
"call NERDTreeHighlightFile('ini', 'yellow', 'none')
"call NERDTreeHighlightFile('md', 'blue', 'none')
"call NERDTreeHighlightFile('yml', 'yellow', 'none')
"call NERDTreeHighlightFile('config', 'yellow', 'none')
"call NERDTreeHighlightFile('conf', 'yellow', 'none')
"call NERDTreeHighlightFile('json', 'yellow', 'none')
"call NERDTreeHighlightFile('html', 'yellow', 'none')
"call NERDTreeHighlightFile('styl', 'cyan', 'none')
"call NERDTreeHighlightFile('css', 'cyan', 'none')
"call NERDTreeHighlightFile('coffee', 'Red', 'none')
"call NERDTreeHighlightFile('js', 'Red', 'none')
"call NERDTreeHighlightFile('php', 'Magenta', 'none')

"""""""""""""""
"             "
"  Syntastic  "
"             "
"""""""""""""""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_jump = 1
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = "✗" " \u2717
let g:syntastic_warning_symbol = "∆" " \u26a0

let g:syntastic_style_error_symbol = "✗" " \u2717
let g:syntastic_style_warning_symbol = "∆" " \u26a0

highlight SyntasticErrorSign ctermbg=red ctermfg=black
highlight SyntasticStyleErrorSign ctermbg=black ctermfg=red

highlight SyntasticWarningSign ctermbg=yellow ctermfg=black
highlight SyntasticStyleWarningSign ctermbg=black ctermfg=yellow

" JavaScript

let g:syntastic_javascript_checkers = ['eslint']

" PHP

let g:syntastic_php_checkers = ['php', 'phpcs']

" TypeScript

let g:syntastic_typescript_checkers = ['tsc', 'tslint']

let g:syntastic_typescript_tsc_args = "--target ES6 --noImplicitAny"

"""""""""""""""""""
"                 "
"  MISCELLANEOUS  "
"                 "
"""""""""""""""""""

let g:PHP_vintage_case_default_indent = 1
