"set autoindent
set tabstop=4
set softtabstop=0 noexpandtab
set number
syntax on
noremap <C-c> <Esc>

call plug#begin('~/.vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
let g:neodark#background='black'
colorscheme neodark
"Add plugins to &runtimepath
call plug#end()

highlight Normal ctermfg = grey ctermbg=black 
execute pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree
iabbrev </ </<C-X><C-O>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
