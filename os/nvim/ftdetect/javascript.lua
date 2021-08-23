local cmd = vim.cmd

cmd([[autocmd BufRead *.es6 set filetype=javascript]])
cmd([[autocmd BufRead *.jsx set filetype=javascript.jsx]])
