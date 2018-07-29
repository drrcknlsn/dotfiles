runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

runtime macros/matchit.vim

set nocompatible

let mapleader = " "

" Disable arrow keys to break the habit and reinforce hjkl navigation
noremap <up> <nop>
inoremap <up> <nop>
noremap <down> <nop>
inoremap <down> <nop>
noremap <left> <nop>
inoremap <left> <nop>
noremap <right> <nop>
inoremap <right> <nop>

" Make j/k work visually for wrapped lines by default
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easier window navigation
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" Quickly move lines and blocks up and down
nnoremap <S-j> :m+<cr>==
nnoremap <S-k> :m-2<cr>==
vnoremap <S-j> :m'>+<cr>gv=gv
vnoremap <S-k> :m-2<cr>gv=gv

" No bells
set noerrorbells
set novisualbell
"set t_vb=
"set tm=500

" Fix backspace key on some systems
set backspace=indent,eol,start

set t_Co=256

syntax on
set background=dark
colorscheme apprentice
highlight MatchParen ctermbg=black ctermfg=white

set showcmd

" Set character encoding to UTF-8 with no BOM
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set nobomb

" Set the preferred/supported EOL styles
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
set number
set relativenumber

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
set softtabstop=2
set autoindent
set smartindent
set cindent " ?

" Only redraw when necessary
set lazyredraw

" Add indentation shortcuts
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Make Y work like C and D
nnoremap Y y$

" Use permanent 'very magic' mode for regexes
nnoremap / /\v
vnoremap / /\v

" Display whitespace and special characters
set list
" eol:¬,
" tab:►\ ,
set listchars=tab:→\ ,trail:·,nbsp:·,extends:…,precedes:…

" Highlight eol/extends/precedes
highlight NonText ctermfg=black

" Highlight unwanted whitespace
highlight SpecialKey ctermbg=black ctermfg=red

" Remove unwanted whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e
"autocmd BufWritePre * :%s/\n\{3,}/\r\r/e
"autocmd BufWritePre * retab
function! FixWhitespace()
  " Trim trailing whitespace
  :%s/\s\+$//e
  " Condense multiple blank lines to a single blank line
  :%s/\n\{3,}/\r\r/e
  " Fix indentation
  retab
endfunction

nnoremap <leader>w :call FixWhitespace()<cr>

" Don't wrap long lines
"set nowrap

" Don't use backups
set nobackup
set nowritebackup
set noswapfile

" Map paste mode, which disables auto-indentation and such
set pastetoggle=[12~

" Help with file type recognition
autocmd BufNewFile,BufRead .eslintrc set ft=json
autocmd BufNewFile,BufRead .jscsrc set ft=json
autocmd BufNewFile,BufRead .jshintrc set ft=json

autocmd BufNewFile,BufRead *.phtml set ft=php sw=2 ts=2

autocmd FileType php set sw=4 ts=4
autocmd FileType blade set sw=2 ts=2

" Assign skeleton files for new buffers
autocmd BufNewFile *.html 0r ~/.dotfiles/vim/skeleton/skeleton.html | normal Gdd
autocmd BufNewFile *.php 0r ~/.dotfiles/vim/skeleton/skeleton.php | normal Gdd
autocmd BufNewFile *.xml 0r ~/.dotfiles/vim/skeleton/skeleton.xml | normal Gdd

" Jump to last position, if possible
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ?
let g:closetag_html_style=1

" Tab characters use error highlighting
"match ErrorMsg /\t\+/

" Long lines use error highlighting
"match WarningMsg /\%<121v.\%>80v/
"match ErrorMsg /\%>120v.\+/
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
  \ 'component_function': {
  \   'filename': 'LightlineFilename'
  \ },
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'absolutepath', 'charvalue']],
  \   'right': [['linter_errors', 'linter_warnings', 'linter_ok'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'component': {
  \   'charvalue': '[%b/0x%B]'
  \ },
  \ }

let g:lightline.component_expand = {
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok'
  \ }

let g:lightline.component_type = {
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error'
  \ }

let g:lightline#ale#indicator_warnings = 'Δ' " U+0394
let g:lightline#ale#indicator_errors = '✘' " U+2718
let g:lightline#ale#indicator_ok = '✔' " U+2714

" Don't show the mode (shown by lightline)
set noshowmode

set showtabline=2

""""""""""""""""""""""""""""""""
"                              "
"  2072/PHP-Indenting-for-VIm  "
"                              "
""""""""""""""""""""""""""""""""

let g:PHP_vintage_case_default_indent = 1
let g:PHP_noArrowMatching = 1

""""""""""""""
"            "
"  w0rp/ale  "
"            "
""""""""""""""

nnoremap <leader>f :ALEFix<cr>
nnoremap <leader>n :ALENext<cr>
nnoremap <leader>p :ALEPrevious<cr>

let g:ale_fixers = {
    \ 'php': ['phpcbf'],
    \ 'scss': ['stylelint']
    \ }
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘' " U+2718
let g:ale_sign_warning = 'Δ' " U+0394
let g:ale_echo_msg_format = '[%linter%] %s'

highlight ALEErrorSign ctermbg=red ctermfg=black
highlight ALEWarningSign ctermbg=yellow ctermfg=black

inoremap <C-]> :ALEGoToDefinition<cr>

function! CleverTab(direction)
  if pumvisible()
    if a:direction == "backward"
      return "\<c-p>"
    elseif a:direction == "forward"
      return "\<c-n>"
    endif
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction

inoremap <expr> <silent> <tab> CleverTab('forward')
inoremap <expr> <silent> <S-tab> CleverTab('backward')

"let g:ale_completion_enabled = 1
set completeopt=menuone,noinsert,noselect

let g:ale_php_phpcs = '~/.config/composer/vendor/bin/phpcs'
"let g:ale_php_phpcs_use_global = 1
"let g:ale_php_phpcs_standard = '~/.dotfiles/phpcs/personal.xml'
"let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcbf_standard = 'PSR12'
let g:ale_php_phpstan_level = 'max'
"let g:ale_php_phpstan_configuration = '~/.dotfiles/phpstan/phpstan.neon'

""""""""""""""""""
"                "
"  junegunn/fzf  "
"                "
""""""""""""""""""

nnoremap <c-p> :FZF<cr>

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }
let g:fzf_layout = { 'down': '~30%' }

"""""""""""""""""""
"                 "
"  MISCELLANEOUS  "
"                 "
"""""""""""""""""""

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
