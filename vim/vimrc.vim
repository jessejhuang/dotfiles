set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set number
set backspace=indent,eol,start
syntax on
noremap <C-c> <Esc>
command W write

if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
			let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
	augroup END
endif
colorscheme onedark

call plug#begin('~/.vim/plugged')
"Add plugins to &runtimepath
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
call plug#end()
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#jedi#python_path = 'python3'

execute pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree
iabbrev </ </<C-X><C-O>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=23

if has("unix")
	let s:uname = system("uname -s")
	if s:uname == "Darwin\n"
		set clipboard=unnamed
	endif
endif
