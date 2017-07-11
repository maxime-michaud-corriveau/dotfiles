set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on

source ~/.sharedvimrc

set background=dark
colorscheme solarized

set incsearch
set hlsearch

"Line/column numbers
set ruler

nnoremap / /\v

set expandtab
set tabstop=4

"Automatically inserts closing brackets
inoremap {} {<CR><CR>}<C-o>%<C-o>=%<down>
inoremap [] [<CR><CR>]<C-o>%<C-o>=%<down>
inoremap <> <<CR><CR>><C-o>%<C-o>=%<down>

"Disables gvim menus 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"Sets the cursor to a block for normal mode, a bar for insert and an underscore for replace mode
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[0 q"


