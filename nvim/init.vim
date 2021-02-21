" Tab witdh
set tabstop=4 shiftwidth=4
set smarttab

" Give more space for displaying messages
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Show matching brackets
set showmatch

" Hybrid line numbering with autoswitching
set number relativenumber

:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Specify a directory for plugins
call plug#begin('~/.vim/plugged/')

" Dracula theme
Plug 'dracula/vim'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorer with icons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme dracula

" File explorer setup
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle file explorer
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
