call plug#begin('~/.local/share/nvim/plugged')
" set white space characters to be shown
set list
" set white space character symbols
set listchars=tab:»\ ,space:·\,eol:¬

Plug 'editorconfig/editorconfig-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-tsserver'
            \ ]
Plug 'scrooloose/nerdtree'
call plug#end()

colorscheme material
