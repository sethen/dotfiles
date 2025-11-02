-- telescope finder

return {
   'nvim-telescope/telescope.nvim',
   event = 'VimEnter',
   branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-project.nvim',
   },
   config = function()
      local keymaps = require('sethen.core.keymaps')
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
         defaults = {
            extensions = {
               advanced_git_search = {},
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
               prompt_position = 'bottom'
            },
            mappings = {
               i = {
                  [keymaps.unselect] = actions.toggle_selection + actions.move_selection_better,
                  [keymaps.select] = actions.toggle_selection + actions.move_selection_worse,
               },
            },
            sorting_strategy = 'ascending',
            prompt_position = 'top'
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

      telescope.load_extension("advanced_git_search")
   end,
   keys = {
      { '<leader>fc',  '<cmd>Telescope commands<CR>',                desc = 'Telescope find commands' },
      { '<leader>fd',  '<cmd>Telescope diagnostics<CR>',             desc = 'Telescope list diagnostics' },
      { '<leader>ff',  '<cmd>Telescope find_files<CR>',              desc = 'Telescope find files' },
      { '<leader>fh',  '<cmd>Telescope help_tags<CR>',               desc = 'Telescope find help' },
      { '<leader>fk',  '<cmd>Telescope keymaps<CR>',                 desc = 'Telescope find keymaps' },
      { '<leader>flr', '<cmd>Telescope lsp_references<CR>',          desc = 'Telescope find lsp references' },
      { '<leader>fls', '<cmd>Telescope lsp_document_symbols<CR>',    desc = 'Telescope find lsp document symbols' },
      { '<leader>fp',  '<cmd>Telescope neovim-project discover<CR>', desc = 'Telescope show projects' },
      { '<leader>fr',  '<cmd>Telescope oldfiles<CR>',                desc = 'Telescope find recent files' },
      { '<leader>fs',  '<cmd>Telescope live_grep<CR>',               desc = 'Telescope find string' },
   },
}
