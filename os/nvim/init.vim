call plug#begin('~/.local/share/nvim/plugged')
	" options {{{
		" set filetype specific plugins
		filetype plugin on
		" set auto indentation
		set autoindent
		" set clipboard support
		set clipboard+=unnamedplus
		" set horizontal line on where cursor currently is
		set cursorline
		" set fold method to marker
		set foldmethod=marker
		" set highlighting of searches
		set hlsearch
		" set case insensitive searching
		set ignorecase
		" set wrapping of long lines
		set linebreak
		" set white space characters to be shown
		set list
		" set white space character symbols
		set listchars=tab:»\ ,space:·,nbsp:␣,eol:¬,trail:·
		" set folds to be open
		set nofoldenable
		" set no swap files
		set noswapfile
		" set line number
		set number
		" set relative number for line number
		set relativenumber
		" set number of lines to show above/below cursor
		set scrolloff=20
		" set how wide an indentation is supposed to span, 0 for replicating tabstop
		set softtabstop=0
		" set the width used for shifting commands, 0 for replicating tabstop
		set shiftwidth=0
		" set line break character symbol
		set showbreak=↪\
		" set the width of displayed tabs
		set tabstop=4
		" set 24-bit color support
		set termguicolors
		" set persistent undo
		if !isdirectory("/tmp/.nvim-undo")
			call mkdir("/tmp/.nvim-undo", "", 0700)
		endif

		set undodir=/tmp/.nvim-undo
		set undofile
		" turn on syntax highlighting
		syntax on
	" }}}

	" plugins {{{
		" comments {{{
			Plug 'scrooloose/nerdcommenter'
		" }}}"

		" completion {{{
			" install coc.nvim for language servers
			Plug 'neoclide/coc.nvim', { 'branch': 'release' }
				let g:coc_global_extensions = [
					\ 'coc-css',
					\ 'coc-eslint',
					\ 'coc-html',
					\ 'coc-json',
					\ 'coc-pairs',
					\ 'coc-prettier',
					\ 'coc-solargraph',
					\ 'coc-rls',
					\ 'coc-tsserver',
					\ 'coc-vimlsp',
					\ 'coc-yaml'
					\ ]
			" }}}

		" directory {{{
			" install vim-startify for initial navigation
			Plug 'mhinz/vim-startify'
				let g:startify_custom_header = []
				let g:startify_change_to_dir = 0
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

		" git {{{
			" install vim-signify for tracking git changes
			Plug 'mhinz/vim-signify'
			" }}}

		" javascript {{{
			" install vim-javascript for javascript syntax highlighting
			Plug 'pangloss/vim-javascript'
			" install vim-jsx-pretty for jsx syntax highlighting
			Plug 'maxmellon/vim-jsx-pretty'
		"}}}

		" search {{{
			" install fzf for searching files
			Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
			" install fzf.vim for fzf tools in vim
			Plug 'junegunn/fzf.vim'
		" }}}

		" status {{{
			" install lightline.vim for status bar
			Plug 'itchyny/lightline.vim'
				let g:lightline = {
					\ 'colorscheme': 'material',
					\ 'active': {
					\   'left':
					\     [
					\       [ 'mode', 'paste' ],
					\       [ 'readonly', 'absolutepath', 'modified' ]
					\     ],
					\   }
					\ }
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
