" This is the neovim configuration file

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
call plug#end()

syntax on
set number
set encoding=utf-8
set nowrapscan
set hidden

set softtabstop=4
set tabstop=4
set shiftwidth=4

" Colorscheme settings 
colorscheme gruvbox
let g:airline_theme='gruvbox'

" Autoformmating via Google
augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	"autocmd FileType python AutoFormatBuffer yapf
	autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
	autocmd FileType vue AutoFormatBuffer prettier
augroup END

" NERDCommenter
nmap <C-k> <Plug>NERDCommenterToggle
vmap <C-k> <Plug>NERDCommenterToggle<CR>gv


" NERDTree
let NERDTreeQuitOnOpen = 1
nmap <F2> :NERDTreeToggle<CR>

"vim-pydocstring
let g:pydocstring_formatter = 'google'
nmap <silent> <C-d> <Plug>(pydocstring)

" This is the default option:
" "   - Preview window on the right with 50% width
" "   - CTRL-/ will toggle preview window.
" " - Note that this array is passed as arguments to fzf#vim#with_preview
" function.
" " - To learn more about preview window options, see `--preview-window`
" section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
"
" " Preview window on the upper side of the window with 40% height,
" " hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
"
" " Empty value to disable preview window altogether
let g:fzf_preview_window = []
