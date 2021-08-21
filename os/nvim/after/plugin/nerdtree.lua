local cmd = vim.cmd

cmd([[autocmd FileType nerdtree nmap <buffer> l o]])
cmd([[autocmd FileType nerdtree silent nmap <buffer> h x]])

local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap('n', '<leader><leader>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

local g = vim.g

g['NERDTreeCascadeSingleChildDir'] = 0
g['NERDTreeDirArrowExpandable'] = ""
g['NERDTreeDirArrowCollapsible'] = ""
g['NERDTreeMinimalUI'] = 1
g['NERDTreeShowHidden'] = 1
