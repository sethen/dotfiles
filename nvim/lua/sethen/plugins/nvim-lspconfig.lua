return {
   'neovim/nvim-lspconfig',
   dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
   },
   config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
         ensure_installed = {
            'biome',
            'cssls',
            'docker_language_server',
            'eslint',
            'fish_lsp',
            'html',
            'jsonls',
            'lua_ls',
            'gopls',
            'rust_analyzer',
            'solargraph',
            'ts_ls',
            'yamlls',
         },
      })

      -- biome
      vim.lsp.config('biome', {})
      vim.lsp.enable('biome')

      -- css
      vim.lsp.config('cssls', {})
      vim.lsp.enable('cssls')

      -- docker
      vim.lsp.config('docker_language_server', {})
      vim.lsp.enable('docker_language_server')

      -- eslint
      vim.lsp.config('eslint', {})
      vim.lsp.enable('eslint')

      -- fish
      vim.lsp.config('fish_lsp', {})
      vim.lsp.enable('fish_lsp')

      -- go
      vim.lsp.config('gopls', {})
      vim.lsp.enable('gopls')

      -- html
      vim.lsp.config('html', {})
      vim.lsp.enable('html')

      -- jsonls
      vim.lsp.config('jsonls', {})
      vim.lsp.enable('jsonls')

      -- lua
      vim.lsp.config('lua_ls', {
         settings = {
            Lua = {
               runtime = {
                  version = 'LuaJIT',
                  path = { 'lua/?.lua', 'lua/?/init.lua' },
               },
               diagnostics = {
                  globals = { 'vim' },
               },
               telemetry = {
                  enable = false,
               },
               workspace = {
                  checkThirdParty = false,
                  library = {
                     vim.env.VIMRUNTIME,
                  },
               },
            },
         }
      })
      vim.lsp.enable('lua_ls')

      -- rust
      vim.lsp.config('rust_analyzer', {})
      vim.lsp.enable('rust_analyzer')

      -- rust
      vim.lsp.config('solargraph', {})
      vim.lsp.enable('solargraph')

      -- typescript
      vim.lsp.config('ts_ls', {})
      vim.lsp.enable('ts_ls')

      -- yaml
      vim.lsp.config('yamlls', {})
      vim.lsp.enable('yamlls')
   end,
}
