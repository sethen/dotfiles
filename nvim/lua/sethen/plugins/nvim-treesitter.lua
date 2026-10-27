-- treesitter configurations

return {
   'nvim-treesitter/nvim-treesitter',
   -- master only supports neovim up to 0.11. on 0.12 its markdown injection
   -- directive gets a list of nodes where it expects one, so every fenced code
   -- block in a readme threw. main is the rewrite: highlighting and indent are
   -- turned on per buffer below instead of through nvim-treesitter.configs
   branch = 'main',
   lazy = false,
   build = ':TSUpdate',
   config = function()
      require('nvim-treesitter').install({
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
      })

      vim.api.nvim_create_autocmd('FileType', {
         callback = function(args)
            -- start throws when no parser is installed for the filetype
            if not pcall(vim.treesitter.start, args.buf) then
               return
            end

            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
         end,
      })
   end,
}
