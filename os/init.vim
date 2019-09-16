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
	" autogroups {{{
		" file types {{{
			augroup FileTypes
				autocmd!
				autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
				autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
			augroup end
		" }}}
		augroup FileTypeAutoIndent
			autocmd!
			autocmd BufWritePre,BufWinEnter *.html,*.js,*.json,*.less,*.py,*.rb,*.scss,*.ts,*.tsx silent :normal gg=G``
		augroup end
		" spell check {{{
			augroup SpellCheck
				autocmd!
				autocmd BufRead,BufNewFile *.md,*.txt setlocal spell
				autocmd FileType gitcommit setlocal spell
			augroup end
		" }}}
	" }}}
	" functions {{{
		function! IsHelpFileType()
			return 'help' =~ &ft
		endfunction

		function! IsNERDTreeFileType()
			return 'nerdtree' =~ &ft
		endfunction

		function! IsStartifyFileType()
			return 'startify' =~ &ft
		endfunction

		function! IsQuickFixFileType()
			return 'qf' =~ &ft
		endfunction

		function! IsIgnoringStatus()
			return '/^help|nerdtree|startify|qf/' =~ &ft
		endfunction
	" }}}
	" key mappings {{{
		let mapleader = "-"
		" type -ev normal (non-recursive) to open init.vim
		nnoremap <leader>ev :split $MYVIMRC<cr>
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
		" set spell check complete in insert mode
		set complete+=kspell
		" set horizontal line on where cursor currently is
		set cursorline
		" set foldmethod to marker
		set foldmethod=marker
		" set highlighting of searches
		set hlsearch
		" set case insensitive searching
		set ignorecase
		" set live effects of commands
		set inccommand=nosplit
		" set wrapping of long lines
		set linebreak
		" set white space characters to be shown
		set list
		" set white space character symbols
		set listchars=tab:»\ ,space:·\,eol:¬
		" set folds to be open
		set nofoldenable
		" set ignore modelines
		set nomodeline
		" set no swap files
		set noswapfile
		" set line number
		set number
		" set opacity for pop up menu
		set pumblend=15
		" set relative number for line number
		set relativenumber
		" set number of lines to show above/below cursor
		set scrolloff=20
		" set to round to nearest multiple of shiftwidth
		set shiftround
		" set number of spaces to use for indentation"
		set shiftwidth=4
		" set no message prompt on startup
		set shortmess=I
		" set line break character symbol
		set showbreak=↪\
		" set showing matches for like brackets
		set showmatch
		" set searching to case sensitive when query contains uppercase
		set smartcase
		" set editing as if the tabs are 4 characters wide
		set softtabstop=4
		" set :split to always split below
		set splitbelow
		" set :vsplit to always split right
		set splitright
		" set the visiable width of tabs
		set tabstop=4
		" set 24-bit color support
		set termguicolors
		" set undo directory for persistent undo
		call mkdir("~/.nvim/undodir", "p", 0700)
		set undodir=~/.nvim/undodir
		" set persistent undo
		set undofile
		" set time for swap to write
		set updatetime=750
		" set menu cycle for file name completion
		set wildmenu
		" set opacity for floating window
		set winblend=15
		" set syntax highlighting
		syntax on
	" }}}
" }}}

" plugins {{{
	" autocompletion {{{
		" install end auto-completion
		Plug 'tpope/vim-endwise'
		" install vim snippets for ultisnips
		Plug 'honza/vim-snippets'
		" install coc auto-completion framework
		Plug 'neoclide/coc.nvim', { 'branch': 'release' }
			let g:coc_global_extensions = [
			\	'coc-css',
			\	'coc-git',
			\	'coc-html',
			\	'coc-json',
			\	'coc-pairs',
			\	'coc-omnisharp',
			\	'coc-rls',
			\	'coc-snippets',
			\	'coc-solargraph',
			\	'coc-tsserver'
			\]

			function! s:CheckBackSpace() abort
				let col = col('.') - 1

				return !col || getline('.')[col - 1]  =~# '\s'
			endfunction

			function! s:ShowDocumentation()
				if &filetype == 'vim'
					execute 'h '.expand('<cword>')
				else
					call CocAction('doHover')
				endif
			endfunction

			" type ctrl+j when pop up menu is visible for both expand and jumping for snippets
			imap <C-j> <Plug>(coc-snippets-expand-jump)
			" type ctrl+j when pop up menu is visible to expand autocompletion
			inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<C-j>"
			" type tab when pop up menu is visible to cycle through autocomplete results
			inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>CheckBackSpace() ? "\<TAB>" : coc#refresh()
			" type shift+tab when pop up menu is visible cycle back through autocomplete results
			inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
			" type H in normal for docs when hovered over
			nnoremap <silent> H :call <SID>ShowDocumentation()<CR>
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
	" javascript {{{
		" install javascript syntax highlighting
		Plug 'pangloss/vim-javascript'
	" }}}
	" jsx {{{
		" install jsx syntax highlighting
		Plug 'maxmellon/vim-jsx-pretty'
	" }}}
	" lint {{{
		Plug 'w0rp/ale'
			let g:ale_fixers = {
			\	'*': [ 'remove_trailing_lines', 'trim_whitespace' ],
			\	'go': [ 'gofmt', 'goimports' ],
			\}
			let g:ale_fix_on_save = 1

			" type control+j in normal to move forward (down) through errors
			nmap <silent> <C-j> <Plug>(ale_next_wrap)
			" type control+k in normal to move back (up) through errors
			nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	" }}}
	" markdown {{{
		" install markdown keymap support
		Plug 'plasticboy/vim-markdown'
	" }}}
	" navigation {{{
		" install start screen for vim
		Plug 'mhinz/vim-startify'
			let g:startify_custom_header = []
			let g:startify_change_to_dir = 0
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
		" install fzf
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		" install fuzzy search for vim
		Plug 'junegunn/fzf.vim'
	" }}}
	" status {{{
		" install lightline status bar
		Plug 'itchyny/lightline.vim'
			let g:lightline = {
			\	'colorscheme': 'material',
			\	'component_function': {
			\		'fileencoding': 'LightlineEncoding',
			\		'filename': 'LightlineFileName',
			\		'gitblame': 'LightlineCocGitBlame',
			\		'gitbranch': 'LightlineGitBranch',
			\		'lineinfo': 'LightlineLineInfo',
			\		'mode': 'LightlineMode',
			\		'readonly': 'LightlineReadOnly'
			\	},
			\	'active': {
			\		'left': [
			\			[ 'mode' ],
			\			[ 'filename', 'gitbranch', 'readonly' ],
			\		],
			\		'right': [
			\			[ 'lineinfo', 'percent' ],
			\			[],
			\			[ 'gitblame', 'fileencoding' ],
			\		],
			\	},
			\	'inactive': {
			\		'left': [
			\			[ 'mode' ],
			\			[ 'filename', 'gitbranch' ],
			\		],
			\		'right': [
			\			[ 'lineinfo', 'percent' ],
			\		]
			\	}
			\}

		function! LightlineCocGitBlame()
			if IsIgnoringStatus()
				return ''
			endif

			return winwidth(0) > 70 ? get(b:, 'coc_git_blame', '') : ''
		endfunction

		function! LightlineEncoding()
			if IsIgnoringStatus()
				return ''
			endif

			return &fileencoding == 'utf-8' ? '' : &fileencoding
		endfunction

		function! LightlineFileName()
			if IsQuickFixFileType()
				return WebDevIconsGetFileTypeSymbol() . ' quickfix'
			endif

			if IsHelpFileType() || IsNERDTreeFileType() || IsStartifyFileType()
				return WebDevIconsGetFileTypeSymbol(). ' ' . &ft
			endif

			let l:filename = expand('%t')

			if l:filename == ''
				return WebDevIconsGetFileTypeSymbol() . ' [No Name]' . LightlineModified()
			endif

			return WebDevIconsGetFileTypeSymbol() . ' ' . l:filename . LightlineModified()
		endfunction

		function! LightlineGitBranch()
			let l:filename = expand('%t')
			let l:gitbranch = fugitive#head()

			if IsIgnoringStatus() || l:filename == '' || l:gitbranch == ''
				return ''
			endif

			return "\uE725" . ' ' . l:gitbranch
		endfunction

		function! LightlineLineInfo()
			if IsIgnoringStatus()
				return ''
			endif

			return printf('%d:%-2d', line('.'), col('.'))
		endfunction

		function! LightlineMode()
			if IsIgnoringStatus()
				return ''
			endif

			return lightline#mode()
		endfunction

		function! LightlineModified()
			if IsIgnoringStatus()
				return ''
			endif

			if !&modifiable
				return ' -'
			endif

			if &modified
				return ' +'
			endif

			return ''
		endfunction

		function! LightlineReadOnly()
			if IsIgnoringStatus()
				return ''
			endif

			return &readonly ? 'ro' : ''
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
		Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'typescript.tsx' ]}
	" }}}
" }}}
call plug#end()

" colors {{{
	colorscheme vim-material
	highlight ALEErrorSign guifg=#F07178
	highlight ALEWarningSign guifg=#FFCB6B
	highlight CursorLine guibg=#212121
	highlight DiffAdd gui=bold guibg=#263238 guifg=#C3E88D
	highlight DiffChange gui=bold guibg=#263238 guifg=#FFCB6B
	highlight DiffDelete gui=bold guibg=#263238 guifg=#FF5370
	highlight link EchoDocFloat Pmenu
	highlight NERDTreeFlags guifg=#C792EA
	highlight PmenuSel blend=15
	highlight Search gui=bold guibg=#FFCB6B guifg=#000000
	highlight SignColumn gui=NONE guibg=#263238
	" colors are reversed here
	highlight StatusLine guifg=#263238 guibg=#FFFFFF
	" colors are reversed here
	highlight StatusLineNC guifg=#263238 guibg=#FFFFFF
	highlight VertSplit ctermbg=NONE guibg=NONE
" }}}

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
endif
