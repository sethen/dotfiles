call plug#begin('~/.local/share/nvim/plugged')
	set background=dark
	" set horizontal line on where cursor currently is
	set cursorline
	" set line number to relative
	set number relativenumber
	" set white space characters to be shown
	set list
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
	Plug 'scrooloose/nerdtree'
		let g:DevIconsDefaultFolderOpenSymbol = "\uf07c"
		let g:DevIconsEnableFoldersOpenClose = 1
		let g:DevIconsEnableFolderExtensionPatternMatching = 1
		let g:NERDTreeMinimalUI = 1
		let g:NERDTreeDirArrowExpandable = "\u00a0"
		let g:NERDTreeDirArrowCollapsible = "\u00a0"
		let g:NERDTreeDisableExactMatchHighlight = 1
		let g:NERDTreeDisablePatternMatchHighlight = 1
		let g:NERDTreeShowHidden = 1
		let g:NERDTreeSyntaxDisableDefaultExtensions = 1
		let g:NERDTreeSyntaxEnabledExtensions = ['bmp', 'c', 'cpp', 'css', 'erb', 'go', 'html', 'jpg', 'js', 'json', 'jsx', 'less', 'markdown', 'md', 'png', 'py', 'rb', 'scss', 'sh', 'sql', 'ts', 'tsx', 'vim']
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = "\uf07b"
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'valloric/youcompleteme', { 'do': './install.py' }
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
highlight SignColumn guibg=NONE gui=NONE guibg=NONE gui=NONE
highlight SignifySignAdd cterm=bold guibg=#263238 guifg=#C3E88D
highlight SignifySignDelete cterm=bold guibg=#263238 guifg=#FF5370
highlight SignifySignChange cterm=bold guibg=#263238  guifg=#FFCB6B
highlight VertSplit ctermbg=NONE guibg=NONE
highlight! link NERDTreeFlags NERDTreeDir
