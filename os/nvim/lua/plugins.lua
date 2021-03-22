-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- manage packer as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- colors
  -- install nvim-colorizer for highlighting color values
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }

  -- comments
  -- install nerdcommenter for easy comments
  use 'scrooloose/nerdcommenter'

  -- completion
  -- install endwise for end completion
  use 'tpope/vim-endwise'

  -- file navigation
  -- install vim-startify for initial navigation
  use {
    'mhinz/vim-startify',
    config = function() require('config.vim-startify') end
  }
  -- install nerdtree from directory browsing
  use {
    'scrooloose/nerdtree',
    requires = {
      'philrunninger/nerdtree-visual-selection',
      'ryanoasis/vim-devicons',
      'tiagofumo/vim-nerdtree-syntax-highlight'
    }
  }

  -- git
  -- install vim-signify for tracking git changes
  use 'mhinz/vim-signify'
  -- install fugitive for git commands in vim
  use 'tpope/vim-fugitive'

  -- javascript
  -- install vim-javascript for javascript syntax highlighting
  use 'pangloss/vim-javascript'
  -- install vim-jsx-pretty for jsx syntax highlighting
  use 'maxmellon/vim-jsx-pretty'

  -- lsp
  -- install lsp for neovim
  use {
    'neovim/nvim-lspconfig',
    config = function() require('config.nvim-lspconfig') end, 
    requires = { 'nvim-lua/completion-nvim' }
  }

  -- search
  -- install fzf for searching files
  use {
    'junegunn/fzf',
    run = './install --all',
	requires = {
      'junegunn/fzf.vim'
	}
  }

  -- status
  -- install lightline.vim for status bar
  use 'itchyny/lightline.vim'

  -- themes
  use {'kaicataldo/material.vim', branch = 'main'}

  -- typescript
  -- install yats.vim for typescript syntax highlighting
  use 'herringtondarkholme/yats.vim'
end)
