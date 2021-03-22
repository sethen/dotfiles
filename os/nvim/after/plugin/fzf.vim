" wrapper for FZF to open buffers in the top left when opening from filetypes
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

nnoremap <silent> <space>bf :call FZFSmartOpen(":Buffers")<CR>
nnoremap <silent> <space>bc :call FZFSmartOpen(":BCommits")<CR>
nnoremap <silent> <space>c :call FZFSmartOpen(":Commits")<CR>
nnoremap <silent> <space>f :call FZFSmartOpen(":Files")<CR>
nnoremap <silent> <space>rg :call FZFSmartOpen(":Rg")<CR>
