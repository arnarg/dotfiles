" lets not use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
 
"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')
 
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
 
" Golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 
" Terraform support
Plug 'hashivim/vim-terraform'
 
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
" numbertoggle plugin
Plug 'jeffkreeftmeijer/vim-numbertoggle'
 
call plug#end()
 
 
""""""""""""
" NERDTREE "
""""""""""""
 
" NERDTree on ctrl+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
 
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
 
 
"""""""
" FZF "
"""""""
 
" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif
 
nnoremap <C-P> :Files<CR>
 
 
"""""""""""
" AIRLINE "
"""""""""""
 
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
 
""""""""""""""""
" NUMBERTOGGLE "
""""""""""""""""
set nu rnu
