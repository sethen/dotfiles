call plug#begin('~/.local/share/nvim/plugged')
	set cursorcolumn                                   " set vertical line on where cursor currently is
	set cursorline                                     " set horizontal line on where cursor currently is
	set number relativenumber                          " set line number to relative
	set list                                           " set white space characters to be shown
	set listchars=eol:↲,space:·,tab:»\                 " set white space character symbols
	set shiftwidth=4                                   " set tab to insert 4 spaces
	set shortmess=I                                    " set no message prompt on startup
	set showbreak=↪\                                   " set line break character symbol
	set tabstop=4                                      " set tab use 4 spaces width
	set termguicolors                                  " set 24-bit color support
	set updatetime=750                                 " set time for swap to write
	syntax on                                          " set syntax highlighting

	Plug 'herringtondarkholme/yats.vim'
	Plug 'hzchirs/vim-material'
		let g:material_style ='dark'
		set background=dark                            " set theme color to dark

	Plug 'itchyny/lightline.vim'
		let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ }

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'mhinz/vim-signify'
	Plug 'scrooloose/nerdtree'
		let DevIconsEnableFoldersOpenClose = 1
		let DevIconsEnableFolderExtensionPatternMatching = 1
		let NERDTreeDirArrowExpandable = "\u00a0"
		let NERDTreeDirArrowCollapsible = "\u00a0"
		let NERDTreeDisableExactMatchHighlight = 1
		let NERDTreeDisablePatternMatchHighlight = 1
		let NERDTreeShowHidden = 1
		let NERDTreeSyntaxDisableDefaultExtensions = 1
		let NERDTreeSyntaxEnabledExtensions = ['bmp', 'c', 'cpp', 'css', 'erb', 'go', 'html', 'jpg', 'js', 'json', 'jsx', 'less', 'markdown', 'md', 'png', 'py', 'rb', 'scss', 'sh', 'sql', 'ts', 'tsx', 'vim']
		let WebDevIconsUnicodeDecorateFolderNodes = 1

	Plug 'terryma/vim-multiple-cursors'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme vim-material                               " set color scheme
highlight CursorLineNr guifg=#FFCB6B
highlight SignifySignAdd cterm=bold guibg=#263238 guifg=#C3E88D
highlight SignifySignDelete cterm=bold guibg=#263238 guifg=#FF5370
highlight SignifySignChange cterm=bold guibg=#263238  guifg=#FFCB6B
highlight SignColumn guibg=NONE gui=NONE guibg=NONE gui=NONE
highlight VertSplit ctermbg=NONE guibg=NONE

