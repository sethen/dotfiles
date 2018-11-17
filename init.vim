" vim plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hzchirs/vim-material'
Plug 'leafgarland/typescript-vim'
Plug 'mhinz/vim-signify'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
call plug#end()

" global internal variables
let g:airline_theme='material'
let g:go_version_warning = 0
let g:material_style='dark'
let g:signify_realtime = 1

" options
colorscheme vim-material            " color scheme
set background=dark
set cursorcolumn                    " set vertical line on where cursor currently is
set cursorline                      " set horizontal line on where cursor currently is
set number                          " set line number
set list                            " shows white space characters
set listchars=eol:↲,space:·,tab:»\  " modifies white space characters
set shiftwidth=4                    " on pressing tab insert 4 spaces
set shortmess=I                     " get rid of message prompt on startup
set showbreak=↪\                    " wraps line break with character
set tabstop=4                       " when indenting with tab use 4 spaces width
set termguicolors
set updatetime=1
syntax on

" overrides
highlight Normal guibg=#2E3436
highlight SignifySignAdd cterm=bold guibg=#2E3436 guifg=#C3E88D
highlight SignifySignDelete cterm=bold guibg=#2E3436 guifg=#FF5370
highlight SignifySignChange cterm=bold guibg=#2E3436  guifg=#FFCB6B
highlight SignColumn guibg=NONE gui=NONE guibg=NONE gui=NONE

" automatic commands
autocmd vimenter * NERDTree
