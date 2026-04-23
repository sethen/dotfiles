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
            'bashls',
            'biome',
            'clangd',
            'cssls',
            'docker_language_server',
            'eslint',
            'elixirls',
            'fish_lsp',
            'html',
            'jdtls',
            'jsonls',
            'kotlin_lsp',
            'lua_ls',
            'gopls',
            'rust_analyzer',
            'solargraph',
            'tailwindcss',
            'taplo',
            'terraformls',
            'ts_ls',
            'yamlls',
         },
      })

      -- bash
      vim.lsp.config('bashls', {})
      vim.lsp.enable('bashls')

      -- biome
      vim.lsp.config('biome', {})
      vim.lsp.enable('biome')

      -- c/c++
      vim.lsp.config('clangd', {})
      vim.lsp.enable('clangd')

      -- css
      vim.lsp.config('cssls', {})
      vim.lsp.enable('cssls')

      -- docker
      vim.lsp.config('docker_language_server', {})
      vim.lsp.enable('docker_language_server')

      -- eslint
      vim.lsp.config('eslint', {})
      vim.lsp.enable('eslint')

      -- exilir
      vim.lsp.config('elixirls', {})
      vim.lsp.enable('elixirls')

      -- fish
      vim.lsp.config('fish_lsp', {})
      vim.lsp.enable('fish_lsp')

      -- go
      vim.lsp.config('gopls', {})
      vim.lsp.enable('gopls')

      -- html
      vim.lsp.config('html', {})
      vim.lsp.enable('html')

      -- java
      vim.lsp.config('jdtls', {})
      vim.lsp.enable('jdtls')

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

      -- kotlin
      vim.lsp.config('kotlin_lsp', {})
      vim.lsp.enable('kotlin_lsp')

      -- rust
      vim.lsp.config('rust_analyzer', {})
      vim.lsp.enable('rust_analyzer')

      -- rust
      vim.lsp.config('solargraph', {})
      vim.lsp.enable('solargraph')

      -- tailwind
      vim.lsp.config('tailwindcss', {})
      vim.lsp.enable('tailwindcss')

      -- terraform
      vim.lsp.config('terraformls', {})
      vim.lsp.enable('terraformls')

      -- toml
      vim.lsp.config('taplo', {})
      vim.lsp.enable('taplo')

      -- typescript
      vim.lsp.config('ts_ls', {})
      vim.lsp.enable('ts_ls')

      -- yaml
      vim.lsp.config('yamlls', {})
      vim.lsp.enable('yamlls')
   end,
}
