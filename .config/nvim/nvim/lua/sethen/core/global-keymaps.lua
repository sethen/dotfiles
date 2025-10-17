local keymap = vim.keymap
local global = vim.g



global.mapleader = ' '

keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Toggle Lazy' })
keymap.set('n', '<leader>o', '<cmd>Oil --float<CR>', { desc = 'Toggle File Buffer Path' })
keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })
keymap.set('n', '<leader>a', '<cmd>CodeCompanionActions<CR>', { desc = 'Code Companion Actions' })
