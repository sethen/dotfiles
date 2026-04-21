-- icons for everything

local icons = require('nvim-web-devicons')
local palette = require('catppuccin.palettes').get_palette('mocha')

local function merge(...)
   local newTable = {}
   local tables = { ... }
   for i = 1, #tables do
      local currentTable = tables[i]
      for key, value in pairs(currentTable) do
         newTable[key] = value
      end
   end
   return newTable
end

return {
   'nvim-tree/nvim-web-devicons',
   dependencies = {
      'catppuccin/nvim',
   },
   config = function()
      icons.setup({
         strict = true,
         override_by_extension = merge(
            require('sethen.plugins.nvim-web-devicons-types.c'),
            require('sethen.plugins.nvim-web-devicons-types.csharp'),
            require('sethen.plugins.nvim-web-devicons-types.css'),
            require('sethen.plugins.nvim-web-devicons-types.dart'),
            require('sethen.plugins.nvim-web-devicons-types.docker'),
            require('sethen.plugins.nvim-web-devicons-types.elixir'),
            require('sethen.plugins.nvim-web-devicons-types.elm'),
            require('sethen.plugins.nvim-web-devicons-types.font'),
            require('sethen.plugins.nvim-web-devicons-types.binary'),
            require('sethen.plugins.nvim-web-devicons-types.go'),
            require('sethen.plugins.nvim-web-devicons-types.graphql'),
            require('sethen.plugins.nvim-web-devicons-types.html'),
            require('sethen.plugins.nvim-web-devicons-types.vue'),
            require('sethen.plugins.nvim-web-devicons-types.image'),
            require('sethen.plugins.nvim-web-devicons-types.video'),
            require('sethen.plugins.nvim-web-devicons-types.java'),
            require('sethen.plugins.nvim-web-devicons-types.javascript'),
            require('sethen.plugins.nvim-web-devicons-types.json'),
            require('sethen.plugins.nvim-web-devicons-types.kotlin'),
            require('sethen.plugins.nvim-web-devicons-types.lua'),
            require('sethen.plugins.nvim-web-devicons-types.log'),
            require('sethen.plugins.nvim-web-devicons-types.markdown'),
            require('sethen.plugins.nvim-web-devicons-types.nginx'),
            require('sethen.plugins.nvim-web-devicons-types.ocaml'),
            require('sethen.plugins.nvim-web-devicons-types.perl'),
            require('sethen.plugins.nvim-web-devicons-types.php'),
            require('sethen.plugins.nvim-web-devicons-types.python'),
            require('sethen.plugins.nvim-web-devicons-types.r'),
            require('sethen.plugins.nvim-web-devicons-types.ruby'),
            require('sethen.plugins.nvim-web-devicons-types.rust'),
            require('sethen.plugins.nvim-web-devicons-types.svelte'),
            require('sethen.plugins.nvim-web-devicons-types.shell'),
            require('sethen.plugins.nvim-web-devicons-types.sql'),
            require('sethen.plugins.nvim-web-devicons-types.swift'),
            require('sethen.plugins.nvim-web-devicons-types.text'),
            require('sethen.plugins.nvim-web-devicons-types.terraform'),
            require('sethen.plugins.nvim-web-devicons-types.toml'),
            require('sethen.plugins.nvim-web-devicons-types.typescript'),
            require('sethen.plugins.nvim-web-devicons-types.vim'),
            require('sethen.plugins.nvim-web-devicons-types.xml'),
            require('sethen.plugins.nvim-web-devicons-types.yaml'),
            require('sethen.plugins.nvim-web-devicons-types.zig'),
            require('sethen.plugins.nvim-web-devicons-types.zip')
         ),
         override_by_filename = merge(
            require('sethen.plugins.nvim-web-devicons-types.angular'),
            require('sethen.plugins.nvim-web-devicons-types.babel'),
            require('sethen.plugins.nvim-web-devicons-types.biome'),
            require('sethen.plugins.nvim-web-devicons-types.capacitor'),
            require('sethen.plugins.nvim-web-devicons-types.docker'),
            require('sethen.plugins.nvim-web-devicons-types.eslint'),
            require('sethen.plugins.nvim-web-devicons-types.git'),
            require('sethen.plugins.nvim-web-devicons-types.go'),
            require('sethen.plugins.nvim-web-devicons-types.image'),
            require('sethen.plugins.nvim-web-devicons-types.javascript'),
            require('sethen.plugins.nvim-web-devicons-types.json'),
            require('sethen.plugins.nvim-web-devicons-types.kubernetes'),
            require('sethen.plugins.nvim-web-devicons-types.markdown'),
            require('sethen.plugins.nvim-web-devicons-types.next'),
            require('sethen.plugins.nvim-web-devicons-types.npm'),
            require('sethen.plugins.nvim-web-devicons-types.prettier'),
            require('sethen.plugins.nvim-web-devicons-types.svelte'),
            require('sethen.plugins.nvim-web-devicons-types.text'),
            require('sethen.plugins.nvim-web-devicons-types.typescript'),
            require('sethen.plugins.nvim-web-devicons-types.tmux'),
            require('sethen.plugins.nvim-web-devicons-types.xml')
         ),
      })

      icons.set_default_icon(' ', palette.overlay2)
   end,
}
