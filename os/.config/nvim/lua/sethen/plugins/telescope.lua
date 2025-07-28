-- telescope fitder

return {
   'nvim-telescope/telescope.nvim',
   event = 'VimEnter',
   branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'ThePrimeagen/harpoon',
      'nvim-telescope/telescope-project.nvim',
   },
   config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
         defaults = {
            extensions = {
               fzf = {
                  fuzzy = true,
                  override_generic_sorter = true,
                  override_file_sorter = true,
                  case_mode = "smart_case",
               },
               project = {
                  base_dirs = {
                     '~/Developer',
                  },
                  hidden_files = true,
                  sync_with_nvim_tree = true,
               },
            },
            layout_strategy = 'bottom_pane',
            layout_config = {
               height = 0.4,
            },
            sorting_strategy = 'ascending',
            prompt_position = 'top',
            mappings = {
               i = {
                  ['<C-j>'] = actions.move_selection_next,
                  ['<C-k>'] = actions.move_selection_previous,
                  ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                  ['<C-l>'] = actions.toggle_selection + actions.move_selection_better,
                  ['<C-h>'] = actions.toggle_selection + actions.move_selection_worse,
               },
            },
         },
         path_display = { 'truncate' },
         pickers = {
            find_files = {
               hidden = true,
            },
         },
         vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
         },
      })

      telescope.load_extension('fzf')
   end,
   keys = {
      { '<Space>fc',  '<cmd>Telescope commands<CR>',                desc = 'Telescope find commands' },
      { '<Space>ff',  '<cmd>Telescope find_files<CR>',              desc = 'Telescope find files' },
      { '<Space>fk',  '<cmd>Telescope keymaps<CR>',                 desc = 'Telescope find keymaps' },
      { '<Space>flr', '<cmd>Telescope lsp_references<CR>',          desc = 'Telescope find lsp references' },
      { '<Space>fls', '<cmd>Telescope lsp_document_symbols<CR>',    desc = 'Telescope find lsp document symbols' },
      { '<Space>fp',  '<cmd>Telescope neovim-project discover<CR>', desc = 'Telescope show projects' },
      { '<Space>fr',  '<cmd>Telescope oldfiles<CR>',                desc = 'Telescope find recent files' },
      { '<Space>fs',  '<cmd>Telescope live_grep<CR>',               desc = 'Telescope find string' },
   },
}
