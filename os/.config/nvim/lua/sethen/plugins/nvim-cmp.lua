return {
   'hrsh7th/nvim-cmp',
   event = { 'InsertEnter', 'CmdlineEnter' },
   dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
   },
   config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')
      local has_words_before = function()
         unpack = unpack or table.unpack
         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      cmp.setup({
         completion = {
            completeopt = "menu,menuone,noinsert"
         },
         formatting = {
            format = lspkind.cmp_format({
               symbol_map = {
                  Class = '',
                  Color = '',
                  Constant = '',
                  Constructor = '',
                  Enum = '',
                  EnumMember = '',
                  Event = '',
                  Field = '',
                  File = '',
                  Folder = '',
                  Function = '',
                  Interface = '',
                  Keyword = '',
                  Method = '',
                  Module = '',
                  Operator = '',
                  Property = '',
                  Reference = '',
                  Snippet = '',
                  Struct = '',
                  Text = '',
                  Type = '',
                  TypeParameter = '',
                  Unit = '',
                  Value = '',
                  Variable = '',
               },
            })
         },
         mapping = {
            ['<C-j>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  if #cmp.get_entries() == 1 then
                     cmp.confirm({ select = true })
                  else
                     cmp.select_next_item()
                  end
               elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
               elseif has_words_before() then
                  cmp.complete()
                  if #cmp.get_entries() == 1 then
                     cmp.confirm({ select = true })
                  end
               else
                  fallback()
               end
            end, { 'i', 's' }),
            ['<C-k>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item()
               elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
               else
                  fallback()
               end
            end, { 'i', 's' }),
            ['<C-l>'] = cmp.mapping.confirm({ select = true }),
         },
         matching = {
            disallow_partial_matching = true,
         },
         sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
         },
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },
      })

      cmp.setup.cmdline('/', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         },
            {
               {
                  name = 'cmdline',
                  option = {
                     ignore_cmds = { 'Man', '!' }
                  }
               }
            })
      })
   end,
}
