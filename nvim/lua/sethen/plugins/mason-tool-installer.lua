-- automatically installs language servers

return {
   'WhoIsSethDaniel/mason-tool-installer.nvim',
   dependencies = {
      'mason-org/mason.nvim',
   },
   config = function()
      require('mason-tool-installer').setup {
         ensure_installed = {
            'bash-language-server',
            'css-lsp',
            'dockerfile-language-server',
            'eslint-lsp',
            'gopls',
            'html-lsp',
            'json-lsp',
            'lua-language-server',
            'solargraph',
            'sqlls',
            'tailwindcss-language-server',
            'typescript-language-server'
         },
         auto_update = true,
         run_on_start = true,
         debounce_hours = 5,
      }
   end
}
