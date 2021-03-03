" Leader key
let mapleader=','

" Tab witdh
set tabstop=4 shiftwidth=4
set smarttab

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Show matching brackets
set showmatch

" Hybrid line numbering with autoswitching
set number relativenumber
" Always show the signcolumn, otherwise it shifts when errors appear
" and disappear
set signcolumn=number

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Find out the highlight group via F10
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Specify a directory for plugins
call plug#begin('~/.vim/plugged/')

" Install lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'feat/lsp-316', 'do': 'yarn install --frozen-lockfile' }

" tmux navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature'

" Install nvcode (Dark+) theme and treesitter
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Rust syntax highliting
" Plug 'rust-lang/rust.vim'
" Plug 'arzg/vim-rust-syntax-ext'

" File explorer with icons
" Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" configure treesitter
"lua << EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"  },
"}
"EOF

" Enable theming support
if (has("termguicolors"))
	set termguicolors
	hi LineNr ctermbg=NONE guibg=NONE
endif

" Configure lightline colorscheme and remove the -- INSERT -- prompt
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\	'left': [	[ 'mode', 'paste' ],
			\				[ 'gitstatus', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component-function': {
			\	'cocstatus': 'coc#status',
			\   'gitbranch': 'gitbranch#name',
			\ },
			\ }
set noshowmode

" Use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax enable
source ~/.config/nvim/jaybee.vim
"colorscheme justb

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Fmt` command to format current buffer.
command! -nargs=0 Fmt :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:Org` command for organize imports of the current buffer.
command! -nargs=0 Org :call     CocAction('runCommand', 'editor.action.organizeImport')

" Rust setup
let g:rustfmt_autosave = 1

" File explorer setup
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle file explorer with Ctrl-b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Disable arrow keys in normal and insert mode
nnoremap <Up> <nop>
inoremap <Up> <nop>

nnoremap <Down> <nop>
inoremap <Down> <nop>

nnoremap <Left> <nop>
inoremap <Left> <nop>

nnoremap <Right> <nop>
inoremap <Right> <nop>

" Prompt -> go to buffer
nnoremap gb :ls<CR>:b<Space>
