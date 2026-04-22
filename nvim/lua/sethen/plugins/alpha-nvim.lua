-- dashboard plugin

return {
   'goolord/alpha-nvim',
   event = 'VimEnter',
   config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
         [[                                                                       ]],
         [[  ██████   █████                   █████   █████  ███                  ]],
         [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
         [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
         [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
         [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
         [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
         [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
         [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
         [[                                                                       ]],
      }

      dashboard.section.buttons.val = {
         dashboard.button('n', '   New File', '<cmd>ene<CR>'),
         dashboard.button('l', '   Lazy', '<cmd>Lazy<CR>'),
         dashboard.button('o', '   File Path Buffer', '<cmd>Oil --float<CR>'),
         dashboard.button('t', '   File Tree', '<cmd>NvimTreeToggle<CR>'),
         dashboard.button('fc', '   Find Command(s)', '<cmd>Telescope commands<CR>'),
         dashboard.button('ff', '   Find File(s)', '<cmd>Telescope find_files<CR>'),
         dashboard.button('fk', '   Find Keymap(s)', '<cmd>Telescope keymaps<CR>'),
         dashboard.button('fp', '   Find Project(s)', '<cmd>Telescope neovim-project discover<CR>'),
         dashboard.button('fr', '   Find Recent File(s)', '<cmd>Telescope oldfiles<CR>'),
         dashboard.button('fs', '   Live Grep', '<cmd>Telescope live_grep<CR>'),
         dashboard.button('q', '   Quit', '<cmd>qa<CR>'),
      }

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

      vim.api.nvim_create_autocmd('User', {
         pattern = 'LazyVimStarted',
         callback = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = '  ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
            pcall(vim.cmd.AlphaRedraw)
         end,
      })

      alpha.setup(dashboard.opts)
   end,
}
