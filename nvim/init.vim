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
Plug 'junegunn/fzf.vim'

" Golang support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Nix support
Plug 'LnL7/vim-nix'

" Terraform support
Plug 'hashivim/vim-terraform'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" numbertoggle plugin
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Automatically create any non-existent directories on write
Plug 'pbrisbin/vim-mkdir'

" GitGutter
Plug 'airblade/vim-gitgutter'

" DeoPlete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" bufstop
Plug 'mihaifm/bufstop'

call plug#end()

""""""""""
" VIM-GO "
""""""""""

let g:go_bin_path = $HOME."/go/bin"

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
nnoremap <leader>f :Ag<CR>


"""""""""""
" AIRLINE "
"""""""""""

let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

""""""""""""""""
" NUMBERTOGGLE "
""""""""""""""""

set nu rnu

""""""""""""
" DEOPLETE "
""""""""""""

let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""
" BUFSTOP "
"""""""""""

nnoremap <leader>b :BufstopFast<CR>
nnoremap <leader>, :BufstopBack<CR>
nnoremap <leader>. :BufstopForward<CR>
