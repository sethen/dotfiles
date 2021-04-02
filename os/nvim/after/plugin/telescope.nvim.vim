nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bf <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>bc <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>


lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<tab>"] = actions.move_selection_next + actions.add_selection,
        ["<s-tab>"] = actions.move_selection_previous,
      }
    },
  }
}
EOF
