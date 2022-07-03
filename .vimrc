set nocompatible

filetype on
filetype plugin indent on

set encoding=utf-8

set number relativenumber
set cursorline
syntax on

set background=dark
" colorscheme solarized

" Make search case insensitive
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms"
set ignorecase
set smartcase

" Backspace fix;
set backspace=indent,eol,start

" tab setting
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set foldmethod=indent
set foldlevel=99

let mapleader = ","

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/AutoComplPop'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'sheerun/vim-polyglot'
Plug 'glench/vim-jinja2-syntax'

call plug#end()

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_solarized'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/dist/*,*/uploads/*,*/tests/*
set list
set listchars=space:·,tab:›\ ,trail:•,eol:¬,extends:#,nbsp:« " Highlight problematic whitespace

let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set textwidth=79
    \| set autoindent
    \| set fileformat=unix

" PSF/Black
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

nmap <leader>f :FZF<CR>
nmap <leader>w :bd<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>h :split<CR>
