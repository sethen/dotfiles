-- telescope finder

return {
   'nvim-telescope/telescope.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
      'nvim-telescope/telescope-project.nvim',
   },
   config = function()
      local keymaps = require('sethen.core.constants').keymaps
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local find_cmd = nil

      if vim.fn.executable('fdfind') == 1 then
         find_cmd = { "fdfind", "--type", "f", "--hidden", "--follow" }
      elseif vim.fn.executable('fd') == 1 then
         find_cmd = { "fd", "--type", "f", "--hidden", "--follow" }
      else
         find_cmd = { "find", ".", "-type", "f" }
      end

      telescope.setup({
         defaults = {
            file_ignore_patterns = {
               "node_modules",
               "%.git/"
            },
            vimgrep_arguments = {
               "rg",
               "--color=never",
               "--no-heading",
               "--with-filename",
               "--line-number",
               "--column",
               "--smart-case",
               "--hidden"
            },
            extensions = {
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
               find_command = find_cmd,
               hidden = true
            },
         },
      })
   end
}
