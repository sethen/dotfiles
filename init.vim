call plug#begin('~/.local/share/nvim/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'leafgarland/typescript-vim'
    Plug 'mhinz/vim-signify'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme base16-default-dark

syntax on                           " enables syntax highlighting
set cursorcolumn                    " set vertical line on where cursor currently is
set cursorline                      " set horizontal line on where cursor currently is
set number                          " set line number
set list                            " shows white space characters
set listchars=eol:↲,space:·,tab:»\  " modifies white space characters
set shiftwidth=4                    " on pressing tab insert 4 spaces
set shortmess=I                     " get rid of message prompt on startup
set showbreak=↪\                    " wraps line break with character
set tabstop=4                       " when indenting with tab use 4 spaces width
set termguicolors                   " use 24-bit color

highlight CursorLine cterm=bold ctermbg=238
highlight CursorColumn cterm=bold ctermbg=238
