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
            layout_strategy = 'bottom_pane',
            layout_config = {
               height = 0.4,
               -- prompt_position belongs to layout_config; a defaults-level one
               -- is not a recognised key and gets dropped
               prompt_position = 'bottom'
            },
            mappings = {
               i = {
                  [keymaps.unselect] = actions.toggle_selection + actions.move_selection_better,
                  [keymaps.select] = actions.toggle_selection + actions.move_selection_worse,
               },
            },
            -- a defaults option, not a top-level one
            path_display = { 'truncate' },
            sorting_strategy = 'ascending',
         },
         pickers = {
            find_files = {
               find_command = find_cmd,
               hidden = true
            },
         },
         -- setup reads extensions at the top level, so nesting this under
         -- defaults silently discarded every option in it
         extensions = {
            project = {
               base_dirs = {
                  require('sethen.core.constants').developer_directory,
               },
               hidden_files = true,
               sync_with_nvim_tree = true,
            },
         },
      })

      -- extensions do nothing until loaded, and both of these are declared as
      -- dependencies above: fzf-native replaces the default sorter (it is the
      -- reason for the cmake build step) and project reads the config above
      telescope.load_extension('fzf')
      telescope.load_extension('project')
   end
}
