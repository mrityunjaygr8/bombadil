call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'preservim/nerdtree'
Plug 'rakr/vim-two-firewatch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

set number
set foldmethod=indent
set foldlevel=99

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
nnoremap <space> za

set background=dark
let g:two_firewatch_italics=1
colorscheme wal

" let g:airline_theme='badwolf'


autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
