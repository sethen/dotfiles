local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { silent = true })
nvim_set_keymap('n', '<leader>gbc', ':BCommits<CR>', { silent = true })
nvim_set_keymap('n', '<leader>gc', ':Commits<CR>', { silent = true })
nvim_set_keymap('n', '<leader>f', ':Files<CR>', { silent = true })
nvim_set_keymap('n', '<leader>rg', ':Rg<CR>', { silent = true })

local cmd = vim.cmd

cmd([[
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({ 'options': '-e' }), <bang>0)
]])
