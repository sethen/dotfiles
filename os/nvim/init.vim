call plug#begin('~/.local/share/nvim/plugged')
	if !isdirectory("/tmp/.nvim-undo")
		call mkdir("/tmp/.nvim-undo", "", 0700)
	endif

	" mappings {{{
		nnoremap <leader>ev :split $MYVIMRC<cr>
		nnoremap <leader>sv :source $MYVIMRC<cr>
	" }}}

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
		" set smartcase for searching
		set smartcase
		" set 24-bit color support
		set termguicolors
		" set undo directory
		set undodir=/tmp/.nvim-undo
		" set undo file for automatic saves
		set undofile
		" set update time for swap
		set updatetime=500
		" turn on syntax highlighting
		syntax on
	" }}}

	" plugins {{{
		" colors {{{
			" install vim-hexokinase for color highlighting
			Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
				let g:Hexokinase_highlighters = ['backgroundfull']
		" }}}

		" comments {{{
			Plug 'scrooloose/nerdcommenter'
		" }}}"

		" completion {{{
			" install for pair completion
			Plug 'jiangmiao/auto-pairs'
				let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '<':'>'}
			" install coc.nvim for language servers
			Plug 'neoclide/coc.nvim', { 'branch': 'release' }
				let g:coc_global_extensions = [
					\ 'coc-css',
					\ 'coc-eslint',
					\ 'coc-highlight',
					\ 'coc-html',
					\ 'coc-json',
					\ 'coc-pairs',
					\ 'coc-solargraph',
					\ 'coc-rls',
					\ 'coc-snippets',
					\ 'coc-tabnine',
					\ 'coc-tsserver',
					\ 'coc-vimlsp',
					\ 'coc-yaml'
					\]
			" install endwise for function completion
			Plug 'tpope/vim-endwise'
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
			" install nerdtree-visual-selection for multi selection in nerdtree
			Plug 'philrunninger/nerdtree-visual-selection'
			" install vim-devicons for file types in telescope
			Plug 'kyazdani42/nvim-web-devicons'
			" install vim-devicons for file types in nerdtree
			Plug 'ryanoasis/vim-devicons'
				let g:DevIconsEnableFoldersOpenClose = 1
			" install vim-nerdtree-syntax-highlight to add color to vim-devicons
			Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
		" }}}

		" git {{{
			" install vim-signify for tracking git changes
			Plug 'mhinz/vim-signify'
			" install fugitive for git commands in vim
			Plug 'tpope/vim-fugitive'
		" }}}

		" go {{{
			" install for golang tools
			Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
		" }}}

		" javascript {{{
			" install vim-javascript for javascript syntax highlighting
			Plug 'pangloss/vim-javascript'
			" install vim-jsx-pretty for jsx syntax highlighting
			Plug 'maxmellon/vim-jsx-pretty'
		"}}}

		" search {{{
			" install for telescope
			Plug 'nvim-telescope/telescope.nvim'
		" }}}

		" {{{
			" install for emmet support
			Plug 'mattn/emmet-vim'
		" }}}"

		" status {{{
			" install lightline.vim for status bar
			Plug 'itchyny/lightline.vim'
				let g:lightline = {
				\  'colorscheme': 'material',
				\  'active': {
				\    'left': [
				\      [ 'mode', 'paste' ],
				\      [ 'readonly', 'absolutepath', 'modified' ]
				\    ],
				\  }
				\}
		" }}}

		" themes {{{
			" install material.vim for theme
			Plug 'kaicataldo/material.vim', { 'branch': 'main' }
		" }}}

		" typescript {{{
			" install yats.vim for typescript syntax highlighting
			Plug 'herringtondarkholme/yats.vim'
		" }}}

		" utilites {{{
			" needed for telescope
			Plug 'nvim-lua/popup.nvim'
			Plug 'nvim-lua/plenary.nvim'
		" }}}
	" }}}
call plug#end()

colorscheme material
highlight CocErrorSign gui=bold guibg=#212121 guifg=#ff5370
highlight CocHighlightText gui=bold guibg=white guifg=black
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
