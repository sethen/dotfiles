function! FZFSmartOpen(cmd)
	if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
		wincmd l
		wincmd k
	endif

	exe a:cmd
endfunction

command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\ 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({ 'options': '-e' }), <bang>0)

nnoremap <silent> <leader>b :call FZFSmartOpen(":Buffers")<CR>
nnoremap <silent> <leader>gbc :call FZFSmartOpen(":BCommits")<CR>
nnoremap <silent> <leader>gc :call FZFSmartOpen(":Commits")<CR>
nnoremap <silent> <leader>f :call FZFSmartOpen(":Files")<CR>
nnoremap <silent> <leader>rg :call FZFSmartOpen(":Rg")<CR>
