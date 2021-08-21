return require('packer').startup(function()
	-- global
	-- packer for package management
	use 'wbthomason/packer.nvim'

	-- colors
	-- install for color highlighting
	use {
		'rrethy/vim-hexokinase',
		run = 'make hexokinase'
	}

	-- completion
	-- install for autocompletion
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}

	-- git
	-- install for tracking git changes
	use 'mhinz/vim-signify'
	-- install for git commands in vim
	use 'tpope/vim-fugitive'

	-- golang
	-- install for golang tools
	use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

	-- html/css
	-- install for emmet support
	use 'mattn/emmet-vim'

	-- icons
	-- install for devicons support
	use {
		'ryanoasis/vim-devicons',
		requires = {{ 'lambdalisue/nerdfont.vim' }, { 'tiagofumo/vim-nerdtree-syntax-highlight' }}
	}

	-- javascript
	-- install for javascript syntax highlighting
	use 'pangloss/vim-javascript'
	-- install for jsx syntax highlighting
	use 'maxmellon/vim-jsx-pretty'

	-- navigation
	-- install for startup screen
	use 'mhinz/vim-startify'
	-- install for file navigation
	use {
		'scrooloose/nerdtree',
		requires = { 'philrunninger/nerdtree-visual-selection' }
	}

	-- search
	-- install for fzf
	use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
	-- install for fzf mappings
	use 'junegunn/fzf.vim'

	-- status
	-- install for status bar support
	use { 'glepnir/galaxyline.nvim' , branch = 'main'}

	-- themes
	-- install for material theme
	use { 'kaicataldo/material.vim', branch = 'main' }

	-- typescript
	-- install for typescript syntax highlighting
	use 'herringtondarkholme/yats.vim'
end)
