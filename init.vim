call plug#begin('~/.local/share/nvim/plugged')
	set background=dark
	" set horizontal line on where cursor currently is
	set cursorline
	" set hidden to abandon buffers
	set hidden
	" set white space characters to be shown
	set list
	" set line number to relative
	set number relativenumber
	" set autocompletion for supported files
	filetype plugin on
	set omnifunc=syntaxcomplete#Complete
	" set white space character symbols
	set listchars=eol:↲,space:·,tab:»\ 
	" set tab to insert 4 spaces
	set shiftwidth=4
	" set no message prompt on startup
	set shortmess=I
	" set line break character symbol
	set showbreak=↪\
	" set tab use 4 spaces width
	set tabstop=4
	" set 24-bit color support
	set termguicolors
	" set time for swap to write
	set updatetime=750
	" set syntax highlighting
	syntax on

	" install typescript syntax highlight
	Plug 'herringtondarkholme/yats.vim'
	Plug 'hzchirs/vim-material'
		let g:material_style='dark'
	Plug 'itchyny/lightline.vim'
		let g:lightline = {
		\	'colorscheme': 'material',
		\}
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'mhinz/vim-signify'
	Plug 'mhinz/vim-startify'
	Plug 'quramy/tsuquyomi'
	Plug 'scrooloose/nerdtree'
		augroup nerdtreehidecwd
			autocmd!
			autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
		augroup end
		let g:DevIconsDefaultFolderOpenSymbol = "\uf115"
		let g:DevIconsEnableFoldersOpenClose = 1
		let g:DevIconsEnableFolderExtensionPatternMatching = 1
		let g:NERDTreeMinimalUI = 1
		let g:NERDTreeDirArrowExpandable = "\u00a0"
		let g:NERDTreeDirArrowCollapsible = "\u00a0"
		let g:NERDTreeHighlightCursorline = 0
		let g:NERDTreeShowHidden = 1
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = "\uf07b"
	Plug 'shougo/vimproc.vim', { 'do' : 'make' }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'valloric/youcompleteme', { 'do': './install.py --all' }
		let g:ycm_rust_src_path = $RUST_SRC_PATH
	Plug 'xuyuanp/nerdtree-git-plugin'
		let g:NERDTreeIndicatorMapCustom = {
		\	'Modified'  : "\uf069",
		\	'Staged'    : "\uf067",
		\	'Untracked' : "\uf005",
		\	'Renamed'   : "\uf061",
		\	'Unmerged'  : "\ue279",
		\	'Deleted'   : "\uf737",
		\	'Dirty'     : "\uf00d",
		\	'Clean'     : "\uf00c",
		\	'Ignored'   : "\uf070",
		\	'Unknown'   : "\uf128"
		\}
	Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme vim-material
highlight CursorLine guibg=#212121
highlight NERDTreeFlags guifg=#c792ea
highlight SignColumn guibg=NONE gui=NONE guibg=NONE gui=NONE
highlight SignifySignAdd cterm=bold guibg=#263238 guifg=#C3E88D
highlight SignifySignDelete cterm=bold guibg=#263238 guifg=#FF5370
highlight SignifySignChange cterm=bold guibg=#263238  guifg=#FFCB6B
highlight VertSplit ctermbg=NONE guibg=NONE

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
endif
