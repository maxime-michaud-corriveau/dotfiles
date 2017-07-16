set nocompatible
filetype off

"{{{ Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-surround'

Plugin 'Valloric/YouCompleteMe'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'L9'
Plugin 'vim-scripts/FuzzyFinder'

call vundle#end()
filetype plugin indent on
"}}}

"Loads partial vimrc shared with ideavim
source ~/.sharedvimrc
filetype on

"{{{ Appearance
set background=dark
colorscheme solarized

"Line/column numbers
set ruler

nnoremap / /\v

set expandtab
set tabstop=4

"Automatically inserts closing brackets
inoremap {} {<CR><CR>}<C-o>%<C-o>=%<down>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap < <><LEFT>

"Disables gvim menus 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"Sets the cursor to a block for normal mode, a bar for insert and an underscore for replace mode
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[0 q"
"}}}

"{{{ search
set incsearch
set hlsearch

"Use regex for searches by default
nnoremap / /\v
"}}}

"{{{ indentation
"Space > tabs
set expandtab
set tabstop=4
set shiftwidth=4
"}}}

"{{{ Extra stuff insertion
"Automatically inserts a function body 
inoremap {} {<CR><CR>}<C-o>%<C-o>=%<down>
inoremap ){ ) {<CR><CR>}<C-o>%<C-o>=%<down>

"Allows inserting new lines with <CR> in normal mode
nnoremap <CR> i<CR><Esc>

"}}}

"{{{ Plugins
"Search files with <C-F>
nnoremap <C-F> :w<CR>:FufFile<CR>

"}}}

"{{{ autocmd & functions
"Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

"This allows for change paste motion cp{motion}
nnoremap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>\"_c" . @"
elseif a:type == 'line'
    silent exe "normal! '[V']\"_c" . @"
elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]\"_c" . @"
else
    silent exe "normal! `[v`]\"_c" . @"
endif
endfunction
"}}}

nnoremap <C-BS> db
nnoremap <C-A-BS> dB
inoremap <C-BS> <Esc>dbi
inoremap <C-A-BS> <Esc>dBi
