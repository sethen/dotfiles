local opt = vim.wo

-- markview falls back to raw pipes for tables when wrap is on, and list
-- draws dots over the padding it adds. window-local so code keeps both
opt.wrap = false
opt.list = false
