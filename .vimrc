" We want the latest Vim settings/options.
" This must be first, because this change other 
" options as side effect
set nocompatible

so ~/.vim/plugins.vim

let mapleader = ','                             " The default leader is \ and
                                                " change it to ,
                                                
set clipboard=unnamed                           " Use the OS clipboard by default
set ttyfast                                     " Optimize for fast terminal connections
set number                                      " Activate the line number
syntax enable                                   " Enable syntax highlight
set backspace=indent,eol,start                  " Allow backspace in insert
                                                " mode

set visualbell                                  " No Sound
set autowriteall                                " Automatically write the file when switching buffer
set complete=.,w,b,u                            " Set our desired autocomplete

"-----------------Indentation-----------------"
set tabstop=4                                   " The width of a TAB is set to 4.
                                                " Still it is a \t. It is just that
                                                " Vim will interpret it to be having
                                                " a width of 4.

set shiftwidth=4                                " Indents will have a width of 4
set softtabstop=4                               " Sets the number of columns for a TAB
set expandtab                                   " Expand TABs to spaces

set wrap                                        " Wrap lines
set linebreak                                   " Wrap line at convenient
                                                " points


"-------------------Visuals-----------------"
colorscheme atom-dark-256                       " Using atom dark-256 theme

set t_CO=256                                    " Use 256 colors.
set guifont=Fira_Code:h17                       " Set guifont
set guioptions-=e                               " Hide gui tabs
set linespace=15                                " Set linespace

hi LineNr ctermbg=bg                            " use same background color
                                                " as line
                                                
" Fake a custom left padding for each window
set foldcolumn=0
hi foldcolumn ctermbg=bg

" Get rid of ugly split borders
hi vertsplit ctermfg=bg ctermbg=bg

"Hide left/right scroll
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


"-------------------Search-----------------"
set hlsearch
set incsearch


"-------------------Split----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-------------------Mappings-----------------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>           " Make it easy to edit vimrc
                                                " file

nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr> " Make it easy to edit plugins
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader>sdp :!grep "snippet" ~/.vim/snippets/php.snippets<cr>

nmap <Leader><space> :nohlsearch<cr>            " Add simple hightlight
                                                " removal

nmap <Leader>f :tag<space>

"-------------------Plugins-----------------" 

"/
"/ CtrP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window  = 'bottom,order:ttb,min:1,max:30,results:30'


nmap <C-R> :CtrlPBufTag<cr>                     " Make it easier to search
                                                " method inside the files

nmap <C-e> :CtrlPMRUFiles<cr>                   " Most recent use file search
                                                " on CtrlP
"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

nmap <C-B> :NERDTreeToggle<cr>                  " Make NERDTree easier to
                                                " toggle
"/
"/ Greplace.vim
"/
set grepprg=ag                                      " Will use ag for the the search.
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


"/
"/ Override to use the silver searcher
"/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
                        
"------------------Laravel-Specific-----------" 
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>la :e routes/api.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CtrlP<cr>app/Modules/


"-------------------Auto-Commands------------" 
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Import classes or functions (add use statements)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"----------------Custom-Commands-----------"
