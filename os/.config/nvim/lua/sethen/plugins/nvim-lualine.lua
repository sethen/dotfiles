return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "nvim-tree/nvim-web-devicons"
   },
   config = function()
      require("lualine").setup({
         options = {
            component_separators = {
               left = '',
               right = ''
            },
            section_separators = {
               left = '',
               right = ''
            },
            globalstatus = true,
            enable_icons = true,
            theme = "catppuccin",
         },
         sections = {
            lualine_a = {'mode'},
            lualine_b = {
               {
                  'branch',
                  icon = {
                     ""
                  }
               },
               'diff',
               'diagnostics',
            },
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
         },
      })
   end,
}
