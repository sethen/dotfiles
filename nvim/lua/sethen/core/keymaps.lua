local keymap = vim.keymap
local global = vim.g

global.mapleader = ' '

keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })
keymap.set('n', '<leader>o', '<cmd>Oil --float<CR>', { desc = 'File Buffer Path' })
keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', { desc = 'NvimTree' })
keymap.set('n', '<leader>fc', '<cmd>Telescope commands<CR>', { desc = 'Find commands' })
keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>', { desc = 'List diagnostics' })
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Find help' })
keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<CR>', { desc = 'Find keymaps' })
keymap.set('n', '<leader>flr', '<cmd>Telescope lsp_references<CR>', { desc = 'Find lsp references' })
keymap.set('n', '<leader>fls', '<cmd>Telescope lsp_document_symbols<CR>', { desc = 'Find lsp document symbols' })
keymap.set('n', '<leader>fp', '<cmd>Telescope neovim-project discover<CR>', { desc = 'Find projects' })
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find recent files' })
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = 'Find string' })
