local keymap = vim.keymap

keymap.set('n', '<Space>l', '<cmd>Lazy<CR>', { desc = 'Toggle Lazy' })
keymap.set('n', '<Space>o', '<cmd>Oil --float<CR>', { desc = 'Toggle File Buffer Path' })
keymap.set('n', '<Space>t', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })
