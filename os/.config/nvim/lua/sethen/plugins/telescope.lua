return {
   'nvim-telescope/telescope.nvim',
   event = 'VimEnter',
   branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
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
         path_display = { 'truncate ' },
         pickers = {
            find_files = {
               hidden = true
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

      local harpoon = require('harpoon')

      harpoon.setup({})

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
         local file_paths = {}
         for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
         end

         require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
               results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({})
         }):find()
      end

      vim.keymap.set("n", "<Space>fm", function() toggle_telescope(harpoon:list()) end, { desc = "Telescope show marks" })
   end,
   keys = {
      { '<Space>ff', '<cmd>Telescope find_files<CR>', desc = 'Telescope find files' },
      { '<Space>flr', '<cmd>Telescope lsp_references<CR>', desc = 'Telescope find lsp references' },
      { '<Space>fls', '<cmd>Telescope lsp_document_symbols<CR>', desc = 'Telescope find lsp document symbols' },
      { '<Space>fp', '<cmd>Telescope neovim-project discover<CR>', desc = 'Telescope show projects' },
      { '<Space>fr', '<cmd>Telescope oldfiles<CR>', desc = 'Telescope find recent files' },
      { '<Space>fs', '<cmd>Telescope live_grep<CR>', desc = 'Telescope find string' },
   },
}
