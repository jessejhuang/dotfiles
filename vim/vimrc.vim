set tabstop=4
set softtabstop=0 noexpandtab
set number
syntax on
noremap <C-c> <Esc>

call plug#begin('~/.vim/plugged')

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

colorscheme onedark
"Add plugins to &runtimepath
call plug#end()

execute pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree
iabbrev </ </<C-X><C-O>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:let g:NERDTreeWinSize=23
