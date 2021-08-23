require('global.commands')
require('global.options')
require('global.highlights')

return require('packer').startup(function()
	-- global
	-- packer for package management
	use 'wbthomason/packer.nvim'

	-- colors
	-- install for color highlighting
	use {
		'rrethy/vim-hexokinase',
		config = require('plugins.hexokinase').config(),
		run = 'make hexokinase'
	}

	-- completion
	-- install for autocompletion
	use { 'neoclide/coc.nvim', branch = 'release' }

	-- git
	-- install for tracking git changes
	use 'mhinz/vim-signify'
	-- install for git commands in vim
	use 'tpope/vim-fugitive'

	-- golang
	-- install for golang tools
	use {
		'fatih/vim-go',
		run = ':GoUpdateBinaries'
	}

	-- html/css
	-- install for emmet support
	use 'mattn/emmet-vim'

	-- icons
	-- install for devicons support
	use 'kyazdani42/nvim-web-devicons'

	-- javascript
	-- install for javascript syntax highlighting
	use 'pangloss/vim-javascript'
	-- install for jsx syntax highlighting
	use 'maxmellon/vim-jsx-pretty'

	-- navigation
	-- install for startup screen
	use {
		'mhinz/vim-startify',
		config = require('plugins.startify').config()
	}

	-- install for file navigation
	use {
		'kyazdani42/nvim-tree.lua',
		config = require('plugins.nvim-tree').config()
	}

	-- search
	-- install for fzf
	use {
		'junegunn/fzf',
		config = require('plugins.fzf').config(),
		run = function() vim.fn['fzf#install']() end
	}
	-- install for fzf mappings
	use 'junegunn/fzf.vim'

	-- status
	-- install for status bar support
	use {
	'hoob3rt/lualine.nvim',
	config = require('plugins.lualine').config()
	}

	-- themes
	-- install for material theme
	use {
		'kaicataldo/material.vim',
		branch = 'main'
	}

	-- typescript
	-- install for typescript syntax highlighting
	use 'herringtondarkholme/yats.vim'
end)

