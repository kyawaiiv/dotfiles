"===============================================================================
" General Settings						*general*

set nocompatible		" vim default, not vi
set nomodeline			" security
set t_Co=256			" set 256 color mode
set encoding=utf-8		" read utf-8
set fileencoding=utf-8		" write utf-8
syntax on			" enable syntax highlighting
set number			" enable line numbers
set laststatus=2		" always show status line

"==============================================================================
" History and Backup Settings					*hist-backup*

set history=200			" save 200 lines of history
set nobackup			" disable backups
set nowritebackup		" do (not) write backups
set noswapfile			" do (not) write swap files

"===============================================================================
" Indentation Settings						*indent*

set nowrap			" do (not) wrap long lines
set autoindent			" auto indent next line
set tabstop=8
set softtabstop=4
set shiftwidth=8
set smartindent
set noexpandtab

"===============================================================================
" Miscellaneous Settings					*misc*

set backspace=2			" enable backspace for everyhing
set lazyredraw			" do (not) update screen when updating macros
set showcmd			" show command on last line of screen
set showmatch			" show bracket matches

"===============================================================================
" Search Settings						*search*

set hlsearch			" highlight search results
set incsearch			" enable incremental searching
set ignorecase			" enable case insensitive searching
set smartcase			" ...unless there are capitals in search

"===============================================================================
" Plugins Settings						*plugins*

" enable pathogen
call pathogen#infect()
call pathogen#helptags()

" enable powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" show hidden files in NERDTree
let NERDTreeShowHidden=1

" use gcc for C syntax checking
let g:syntastic_c_checkers=['gcc']

"===============================================================================
" GUI Settings							*gui*

if has('gui_running')
	set guifont=Menlo\ 9
	colorscheme kolor
	set guiheadroom=0	" remove empty space at bottom of gui
	set go-=m		" remove menubar
	set go-=T		" remove toolbar
	set go-=r		" remove right-hand scrollbar
	set go-=R		" ...even on vertical split
	set go-=l		" remove left-hand scrollbar
	set go-=L		" ...even on vertical split

	" toggle menubar with ctl-F1
	nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif

"===============================================================================
" Keybinds and Macros						*keys-macros*

" clear search highlighting with ./
nmap <silent> ./ :nohlsearch<CR>

" write read-only files with w!!
cmap w!! w !sudo tee % >/dev/null

" toggle NERDTree with ctl-f
map <C-f> :NERDTreeToggle<CR>

" toggle tagbar with f8
nmap <F8> :TagbarToggle<CR>
