return {
   'nvim-lualine/lualine.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons'
   },
   config = function()
      local function is_file_type(ft)
         local file_type = vim.fn.expand(vim.bo.filetype)

         return ft == file_type
      end

      local function is_alpha_file_type()
         return is_file_type('alpha')
      end

      local function is_help_file_type()
         return is_file_type('help')
      end

      local function is_lazy_file_type()
         return is_file_type('lazy')
      end

      local function is_nvim_tree_file_type()
         return is_file_type('NvimTree')
      end

      local function is_telescope_file_type()
         return is_file_type('TelescopePrompt')
      end

      local function is_any_ignored_file_type()
         if is_alpha_file_type()
            or is_help_file_type()
            or is_lazy_file_type()
            or is_nvim_tree_file_type()
            or is_telescope_file_type() then
            return false
         end

         return true
      end

      local function filename()
         if is_alpha_file_type() then
            return ' dashboard'
         elseif is_lazy_file_type() then
            return ' lazy'
         elseif is_help_file_type() then
            return ' help'
         elseif is_nvim_tree_file_type() then
            return ' nvimtree'
         elseif is_telescope_file_type() then
            return ' telescope'
         end

         local _, devicons = pcall(require, 'nvim-web-devicons')
         local f_name, f_extension = vim.fn.expand('%:t'), vim.fn.expand('%:e')
         local icon = devicons.get_icon(f_name, f_extension)
         local file_name = vim.fn.expand('%:t:~')

         return icon .. ' ' .. file_name
      end

      require('lualine').setup({
         options = {
            component_separators = {
               left = '',
               right = '',
            },
            section_separators = {
               left = '',
               right = '',
            },
            globalstatus = true,
            enable_icons = true,
            theme = 'catppuccin',
         },
         sections = {
            lualine_a = {
               {
                  'mode',
                  cond = is_any_ignored_file_type,
               },
            },
            lualine_b = {},
            lualine_c = {
               {filename},
               '%=',
               {
                  'branch',
                  color = {
                     fg = '#CDD6F4'
                  },
                  cond = is_any_ignored_file_type,
                  icon = {
                     ''
                  },
               },
               {
                  'diff',
                  cond = is_any_ignored_file_type,
                  symbols = {
                     added = '+',
                     modified = '~',
                     removed = '-'
                  },
               },
               {
                  'diagnostics',
                  symbols = {
                     error = ' ',
                     warn = ' ',
                     info = ' ',
                     hint = ' ',
                  },
               },
            },
            lualine_x = {'encoding'},
            lualine_y = {},
            lualine_z = {
               {
                  'progress',
                  cond = function()
                     return not is_telescope_file_type()
                  end
               },
            },
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {},
         },
      })
   end,
}
