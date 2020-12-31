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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
set number
set encoding=utf-8


colorscheme gruvbox
let g:airline_theme='gruvbox'


 "NERDCommenter
nmap <C-k> <Plug>NERDCommenterToggle
vmap <C-k> <Plug>NERDCommenterToggle<CR>gv


" NERDTree

let NERDTreeQuitOnOpen = 1
nmap <F2> :NERDTreeToggle<CR>



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
