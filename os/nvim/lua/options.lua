local opt = vim.opt

-- set auto indentation
opt.autoindent = true
-- set clipboard support
opt.clipboard = "unnamedplus"
-- set horizontal line on where cursor currently is
opt.cursorline = true
-- set folds to be open
opt.foldenable = true
-- set fold method to marker
opt.foldmethod = "marker"
-- set highlighting of searches
opt.hlsearch = true
-- set wrapping of long lines
opt.linebreak = true
-- set whitespace characters to be shown
opt.list = true
-- set whitespace character symbols
opt.listchars = "tab:» ,space:·,nbsp:␣,eol:¬,trail:·"
-- set line number
opt.number = true
-- set number of lines to show above/below cursor
opt.relativenumber = true
-- set number of lines to show above/below cursor
opt.scrolloff = 20
-- set the width used for shifting commands, 0 for replicating tabstop
opt.shiftwidth=0
-- set line break character symbol
opt.showbreak = "↪"
-- set smartcase for searching
opt.smartcase = true
-- set how wide an indentation is supposed to span, 0 for replicating tabstop
opt.softtabstop = 0
-- set no swap files
opt.swapfile = false
-- set the width of displayed tabs
opt.tabstop = 4
-- set 24-bit color support
opt.termguicolors = true
-- set undo directory
opt.undodir = "/tmp/.nvim-undo"
-- set undo file for automatic saves
opt.undofile = true
