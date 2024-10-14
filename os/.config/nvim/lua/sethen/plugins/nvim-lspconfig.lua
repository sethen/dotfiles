return {
   'neovim/nvim-lspconfig',
   dependencies = {
      'williamboman/mason.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'folke/neodev.nvim',
   },
   config = function()
      require('neodev').setup()
      require('mason').setup()

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local handlers = {
         function (server_name)
            require('lspconfig')[server_name].setup({
               capabilities = lsp_capabilities,
            })
         end,
         ['lua_ls'] = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({
               settings = {
                  Lua = {
                     completion = {
                        callSnippet = 'Replace'
                     },
                  },
               },
            })
         end
      }

      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup({
         ensure_installed = {
            'cssls',
            'gopls',
            'html',
            'jsonls',
            'lua_ls',
            'solargraph',
            'sqlls',
            'ts_ls',
            'zls'
         },
      })
      mason_lspconfig.setup_handlers(handlers)

      vim.api.nvim_create_autocmd('LspAttach', {
         desc = 'LSP actions',
         callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
         end,
      })

      vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
   end,
}
