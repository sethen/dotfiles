-- temporary until new release
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- set auto identation
opt('b', 'autoindent', true)
-- set clipboard to copy from neovim
opt('o', 'clipboard', 'unnamedplus')
-- set horizontal line on where cursor currently is
opt('w', 'cursorline', true)
-- set fold method to marker
opt('w','foldmethod', 'marker')
-- set highlighting of searches
opt('o', 'hlsearch', true)
-- set wrapping of long lines
opt('w', 'linebreak', true)
-- set white space characters to be shown
opt('o', 'list', true)
-- set white space character symbols
opt('o', 'listchars', 'tab:» ,space:·,nbsp:␣,eol:¬,trail:·')
-- set folds to be open
opt('w', 'foldenable', false)
-- set no swap files
opt('o', 'swapfile', false)
-- set line number
opt('w', 'number', true)
-- set relative number for line number
opt('w', 'relativenumber', true)
-- set number of lines to show above/below cursor
opt('o', 'scrolloff', 20)
-- set how wide an indentation is supposed to span, 0 for replicating tabstop
opt('b', 'softtabstop', 0)
-- set the width used for shifting commands, 0 for replicating tabstop
opt('o', 'shiftwidth', 0)
-- set line break character symbol
opt('o', 'showbreak', '↪')
-- set the width of displayed tabs
opt('b', 'tabstop', 4)
-- set smartcase for searching
opt('o', 'smartcase', true)
-- set 24-bit color support
opt('o', 'termguicolors', true)
-- set undo directory
opt('o', 'undodir', '/tmp/.nvim-undo')
-- set undo file for automatic saves
opt('o', 'undofile', true)
-- set update time for swap
opt('o', 'updatetime', 500)
