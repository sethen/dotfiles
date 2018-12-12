" vim plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hzchirs/vim-material'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'honza/vim-snippets'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'leafgarland/typescript-vim'
Plug 'mhinz/vim-signify'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
call plug#end()

" global internal variables
let g:airline_theme = 'material'
let g:go_version_warning = 0
let NERDTreeShowHidden= 1
let g:material_style='dark'
let g:pymode_python = 'python3'
let g:signify_realtime = 1
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-L>'
let g:UltiSnipsJumpBackwardTrigger = '<C-h>'

" options
colorscheme vim-material            " set color scheme
set background=dark                 " set theme color to dark
set cursorcolumn                    " set vertical line on where cursor currently is
set cursorline                      " set horizontal line on where cursor currently is
set number relativenumber           " set line number
set list                            " set white space characters to be shown
set listchars=eol:↲,space:·,tab:»\  " set white space characters
set shiftwidth=4                    " set tab to insert 4 spaces
set shortmess=I                     " set no message prompt on startup
set showbreak=↪\                    " set line break with character
set tabstop=4                       " set tab use 4 spaces width
set termguicolors                   " set 24-bit color support
set updatetime=1                    " set time for swap to write
syntax on                           " set syntax highlighting

" overrides
highlight CursorColumn guibg=#212121
highlight CursorLine guibg=#212121
highlight Directory guifg=#CFCFCF
highlight CursorLineNr guifg=#FFCB6B
highlight Normal guibg=#2E3436
highlight SignifySignAdd cterm=bold guibg=#2E3436 guifg=#C3E88D
highlight SignifySignDelete cterm=bold guibg=#2E3436 guifg=#FF5370
highlight SignifySignChange cterm=bold guibg=#2E3436  guifg=#FFCB6B
highlight SignColumn guibg=NONE gui=NONE guibg=NONE gui=NONE

" automatic commands
autocmd vimenter * NERDTree
