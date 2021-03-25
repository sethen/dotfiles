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
			" install for language server support
			Plug 'neovim/nvim-lspconfig'
			" install autocomplete
			Plug 'nvim-lua/completion-nvim'
			" install function completion
			Plug 'tpope/vim-endwise'
		" }}}

		" directory {{{
			" install initial navigation
			Plug 'mhinz/vim-startify'
				let g:startify_custom_header = []
				let g:startify_change_to_dir = 0
			" install directory browsing
			Plug 'scrooloose/nerdtree'
				let g:NERDTreeDirArrowExpandable = "\u00a0"
				let g:NERDTreeDirArrowCollapsible = "\u00a0"
				let g:NERDTreeMinimalUI = 1
				let g:NERDTreeShowHidden = 1
			" install for multi selection in nerdtree
			Plug 'philrunninger/nerdtree-visual-selection'
			" install for file types in nerdtree
			Plug 'ryanoasis/vim-devicons'
				let g:DevIconsEnableFoldersOpenClose = 1
			" install for color to vim-devicons
			Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
		" }}}

		" git {{{
			" install for tracking git changes
			Plug 'mhinz/vim-signify'
			" install for git commands in vim
			Plug 'tpope/vim-fugitive'
		" }}}

		" javascript {{{
			" install for javascript syntax highlighting
			Plug 'pangloss/vim-javascript'
			" install for jsx syntax highlighting
			Plug 'maxmellon/vim-jsx-pretty'
		"}}}

		" search {{{
			" install for searching files
			Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
			" install  for fzf tools in vim
			Plug 'junegunn/fzf.vim'
		" }}}

		" status {{{
			" install for status bar
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

		" tags {{{
			" install for displaying tags
			Plug 'majutsushi/tagbar'
		" }}}

		" themes {{{
			" install for theme
			Plug 'kaicataldo/material.vim', { 'branch': 'main' }
		" }}}

		" typescript {{{
			" install for syntax highlighting
			Plug 'herringtondarkholme/yats.vim'
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

lua << EOF
local servers = { "tsserver" }
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  require'completion'.on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead gui=bold guifg=black guibg=white
      hi LspReferenceText gui=bold guifg=black guibg=white
      hi LspReferenceWrite gui=bold guifg=black guibg=white
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach;
    root_dir = function(fname)
      return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
  }
end
EOF
