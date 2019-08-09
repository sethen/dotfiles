call plug#begin('~/.local/share/nvim/plugged')
" general {{{
	" abbreviations {{{
		abbr adn and
		abbr calss class
		abbr cosnt const
		abbr cotns const
		abbr conts const
		abbr eles else
		abbr fro for
		abbr functoin function
		abbr funtcion function
		abbr teh the
		abbr vra var
	" }}}
	" options {{{
		" set read file when it is changed outside of nvim
		set autoread
		" set auto indentation
		set autoindent
		" set background to dark
		set background=dark
		" set indent for overflowing words
		set breakindent
		" set indent options for overflowing words
		set breakindentopt=sbr
		" set clipboard copy
		set clipboard=unnamedplus
		" set command height
		set cmdheight=2
		" set horizontal line on where cursor currently is
		set cursorline
		" set foldmethod to marker
		set foldmethod=marker
		" set highlighting of searches
		set hlsearch
		" set white space characters to be shown
		set list
		" set line number to relative
		set number relativenumber
		" set white space character symbols
		set listchars=eol:↲,space:·,tab:»\ 
		" set editing as if the tabs are 4 characters wide
		set softtabstop=4
		" set number of spaces to use for indentation"
		set shiftwidth=4
		" set no message prompt on startup
		set shortmess=I
		" set line break character symbol
		set showbreak=↪\
		" set the visiable width of tabs
		set tabstop=4
		" set 24-bit color support
		set termguicolors
		" set time for swap to write
		set updatetime=750
		" set syntax highlighting
		syntax on
	" }}}
	" spaces and tabs {{{
		augroup FileTypeIndentation
			autocmd FileType css setlocal tabstop=4 shiftwidth=4
			autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2
			autocmd FileType go setlocal tabstop=4 shiftwidth=4
			autocmd FileType javascript setlocal tabstop=4 shiftwidth=4
			autocmd FileType html setlocal tabstop=4 shiftwidth=4
			autocmd FileType less setlocal tabstop=4 shiftwidth=4
			autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
			autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
			autocmd FileType rust setlocal expandtab tabstop=4 shiftwidth=4
			autocmd FileType scss setlocal tabstop=4 shiftwidth=4
			autocmd FileType typescript setlocal tabstop=4 shiftwidth=4
			autocmd FileType vim setlocal tabstop=4 shiftwidth=4
		augroup end
	" }}}
" }}}

" plugins {{{
	" autocompletion {{{
		" install vim snippets for ultisnips
		Plug 'honza/vim-snippets'
		" install coc auto-completion framework
		Plug 'neoclide/coc.nvim', { 'branch': 'release' }
			let g:coc_global_extensions = [
			\	'coc-css',
			\	'coc-html',
			\	'coc-json',
			\	'coc-python',
			\	'coc-rls',
			\	'coc-snippets',
			\	'coc-solargraph',
			\	'coc-tsserver'
			\]

			inoremap <silent><expr> <TAB>
			\	pumvisible() ? "\<C-n>" :
			\	<SID>check_back_space() ? "\<TAB>" :
			\	coc#refresh()
			inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
			nmap <silent> gd <Plug>(coc-definition)
			nmap <silent> gy <Plug>(coc-type-definition)
			nmap <silent> gi <Plug>(coc-implementation)
			nmap <silent> gr <Plug>(coc-references)
			nnoremap <silent> K :call <SID>show_documentation()<CR>

			function! s:check_back_space() abort
				let col = col('.') - 1
				return !col || getline('.')[col - 1]  =~# '\s'
			endfunction

			function! s:show_documentation()
				if &filetype == 'vim'
					execute 'h '.expand('<cword>')
				else
					call CocAction('doHover')
				endif
			endfunction
		" install echdoc support for coc
		Plug 'shougo/echodoc'
			let g:echodoc_enable_at_startup = 1
			let g:echodoc#type = 'floating'
		" install ultisnips for templating
		Plug 'sirver/ultisnips'
			let g:UltiSnipsExpandTrigger = '<c-j>'
			let g:UltiSnipsJumpForwardTrigger = '<c-j>'
			let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
			let g:UltiSnipsListSnippets = '<c-h>'
	" }}}
	" git {{{
		" install git sidebar
		Plug 'mhinz/vim-signify'
		" install git wrapper
		Plug 'tpope/vim-fugitive'
		" install nerdtree git status
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
	" }}}
	" markdown {{{
		" install markdown keymap support
		Plug 'plasticboy/vim-markdown'
	" }}}
	" navigation {{{
		" install start screen for vim
		Plug 'mhinz/vim-startify'
		" install nerdtree tree explorer
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
	" }}}
	" search {{{
		" install fzf"
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		" install fuzzy search for vim
		Plug 'junegunn/fzf.vim'
	" }}}
	" status {{{
		" install lightline status bar
		Plug 'itchyny/lightline.vim'
			let g:lightline = {
			\	'active': {
			\		'left': [
			\			[ 'mode', 'paste' ],
			\			[ 'filesynbolandname', 'gitbranch' ],
			\		],
			\		'right':[
			\			[ 'lineinfo', 'percent' ],
			\			[],
			\			[ 'gitblame', 'cocstatus', 'coccurrentfunction', 'fileencoding' ],
			\		],
			\	},
			\	'component_function': {
			\		'coccurrentfunction': 'CocCurrentFunction',
			\		'cocstatus': 'coc#status',
			\		'fileencoding': 'FileEncoding',
			\		'filesynbolandname': 'FileSymbolAndName',
			\		'gitblame': 'GitBlame',
			\		'gitbranch': 'GitBranch',
			\	},
			\	"colorscheme": "material"
			\}

			function! CocCurrentFunction()
				return get(b:, 'coc_current_function', '')
			endfunction

			function! FileSymbolAndName()
				let filename = expand('%')

				if filename =~ 'NERD_tree'
					return ''
				endif

				if filename == ''
					return WebDevIconsGetFileTypeSymbol()
				endif

				return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%')
			endfunction

			function! FileEncoding()
				return &fileencoding == 'utf-8' ? '' : &fileencoding
			endfunction

			function! GitBlame()
				return winwidth(0) > 70 ? get(b:, 'coc_git_blame', '') : ''
			endfunction

			function! GitBranch()
				let filename = expand('%')
				let gitbranch = fugitive#head()

				if filename =~ 'NERD_tree' || filename == '' || gitbranch == ''
					return ''
				endif

				return "\uE725" . ' ' . gitbranch
			endfunction
	" }}}
	" text {{{
		" install text filtering and alignment
		Plug 'godlygeek/tabular'
		" install support for commenting keymaps
		Plug 'tpope/vim-commentary'
		" install bracket surrounding support
		Plug 'tpope/vim-surround'
	" }}}
	" theme {{{
		" install material theme
		Plug 'hzchirs/vim-material'
			let g:material_style = 'dark'
		" install devicons for directories and files
		Plug 'ryanoasis/vim-devicons'
		" install nerdtree support for devicons
		Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" }}}
	" typescript {{{
		" install typescript syntax highlighting
		Plug 'herringtondarkholme/yats.vim'
	" }}}
" }}}
call plug#end()

" colors {{{
	colorscheme vim-material
	highlight CursorLine guibg=#212121
	highlight link EchoDocFloat Pmenu
	highlight NERDTreeFlags guifg=#C792EA
	highlight Search gui=bold guibg=#FFCB6B guifg=#000000
	highlight SignColumn guibg=NONE gui=NONE guibg=#263238 gui=NONE
	highlight DiffAdd gui=bold guibg=#263238 guifg=#C3E88D
	highlight DiffChange gui=bold guibg=#263238 guifg=#FFCB6B
	highlight DiffDelete gui=bold guibg=#263238 guifg=#FF5370
	highlight VertSplit ctermbg=NONE guibg=NONE
" }}}

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
endif
