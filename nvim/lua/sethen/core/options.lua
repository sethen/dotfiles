local opt = vim.opt
local o = vim.o

o.winborder = 'rounded'

-- options
opt.autoindent = true
opt.completeopt = 'menu,noinsert'
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.fcs = 'eob: '
opt.hlsearch = true
opt.ignorecase = true
opt.linebreak = true
opt.list = true
opt.listchars = 'tab:» ,space:·,nbsp:␣,eol:¬,trail:·'
opt.number = true
opt.scrolloff = 25
opt.smartindent = true
opt.splitright = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.termguicolors = true
opt.mouse = 'a'
opt.undofile = true
opt.undodir = '/tmp/nvim-undo'
opt.updatetime = 1000
