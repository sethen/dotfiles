-- treesitter configurations

return {
   'nvim-treesitter/nvim-treesitter',
   -- upstream made main the default branch, and it is an incompatible rewrite
   -- with no nvim-treesitter.configs module: no ensure_installed, no highlight
   -- or indent options, no matchup integration. master is locked but stays
   -- available, so pin it rather than rebuild this config around the new API
   branch = 'master',
   build = ':TSUpdate',
   config = function()
      require('nvim-treesitter.configs').setup({
         ensure_installed = {
            'bash',
            'c',
            'css',
            'dockerfile',
            'fish',
            'gitignore',
            'go',
            'html',
            'json',
            'javascript',
            'lua',
            'markdown',
            'markdown_inline',
            'php',
            'python',
            'svelte',
            'toml',
            'typescript',
            'tsx',
            'yaml',
            'vim',
            'vimdoc',
            'xml',
            'zig'
         },
         highlight = {
            enable = true,
         },
         indent = {
            enable = true,
         },
      })
   end,
}
