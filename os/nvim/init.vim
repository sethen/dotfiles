call plug#begin('~/.local/share/nvim/plugged')
    " options {{{
        " set horizontal line on where cursor currently is
        set cursorline
        " set fold method to marker
        set foldmethod=marker
        " set wrapping of long lines
        set linebreak
        " set white space characters to be shown
        set list
        " set white space character symbols
        set listchars=tab:»\ ,space:·,nbsp:␣,eol:¬,trail:·
        " set folds to be open
        set nofoldenable
        " set line number
        set number
        " set relative number for line number
        set relativenumber
        " set line break character symbol
        set showbreak=↪\
        " set 24-bit color support
        set termguicolors

        syntax on
    " }}}

    " plugins {{{
        " completion {{{
            " install coc.nvim for language servers
            Plug 'neoclide/coc.nvim', { 'branch': 'release' }
                let g:coc_global_extensions = [
                    \ 'coc-json',
                    \ 'coc-html',
                    \ 'coc-solargraph',
                    \ 'coc-tsserver',
                    \ 'coc-yaml'
                    \ ]
        " }}}

        " directory {{{
            " install vim-startify for initial navigation
            Plug 'mhinz/vim-startify'
            " install nerdtree from directory browsing
            Plug 'scrooloose/nerdtree'
                let g:NERDTreeDirArrowExpandable = "\u00a0"
                let g:NERDTreeDirArrowCollapsible = "\u00a0"
                let g:NERDTreeMinimalUI = 1
                let g:NERDTreeShowHidden = 1
            " install vim-devicons for file types in nerdtree
            Plug 'ryanoasis/vim-devicons'
                let g:DevIconsEnableFoldersOpenClose = 1
            " install vim-nerdtree-syntax-highlight to add color to vim-devicons
            Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        " }}}

        " formatting {{{
            " install editorconfig-vim for indentation
            Plug 'editorconfig/editorconfig-vim'
        " }}}

        " javascript {{{
            " install vim-javascript for javascript syntax highlighting
            Plug 'pangloss/vim-javascript'
            " install vim-jsx-pretty for jsx syntax highlighting
            Plug 'maxmellon/vim-jsx-pretty'
        "}}}

        " git {{{
            Plug 'mhinz/vim-signify'
        " }}}

        " status {{{
            " install lightline.vim for status bar
            Plug 'itchyny/lightline.vim'
                let g:lightline = { 'colorscheme': 'material_vim' }
        " }}}

        " themes {{{
            " install material.vim for theme
            Plug 'kaicataldo/material.vim', { 'branch': 'main' }
        " }}}

        " typescript {{{
            " install yats.vim for typescript syntax highlighting
            Plug 'herringtondarkholme/yats.vim'
        " }}}
    " }}}
call plug#end()

colorscheme material
highlight CocErrorHighlight gui=bold guibg=#212121 guifg=#ff5370
highlight CocErrorSign gui=bold guibg=#212121 guifg=#ff5370
highlight CocInfoHighlight gui=bold guibg=#212121 guifg=#ffcb6b
highlight CocInfoSign gui=bold guibg=#212121 guifg=#ffcb6b
highlight CursorLine guibg=#212121
highlight CursorLineNr gui=bold guibg=#212121 guifg=#89ddff
highlight Folded gui=bold guibg=#212121 guifg=#546e7a
highlight LineNr guifg=#546e7a
highlight SignifySignAdd gui=BOLD guibg=#212121 guifg=#c3e88d
highlight SignifySignChange gui=BOLD guibg=#212121 guifg=#ffcb6b
highlight SignifySignDelete gui=BOLD guibg=#212121 guifg=#ff5370
highlight VertSplit guifg=#263238
