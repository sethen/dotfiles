-- treesitter configurations

return {
   'nvim-treesitter/nvim-treesitter',
   dependencies = {
      'windwp/nvim-ts-autotag'
   },
   build = ':TSUpdate',
   config = function()
      require('nvim-treesitter').setup({
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
         matchup = {
            enable = true,
         },
      })
   end,
}
