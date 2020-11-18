" wrapper for FZF to open buffers in the top left when opening from filetypes
function! FZFSmartOpen(cmd)
	if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
		wincmd l
		wincmd k
	endif

	exe a:cmd
endfunction

" customize the Rg command for searching
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\ 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({ 'options': '-e' }), <bang>0)

" use <CTRL+B> to show buffers in FZF
nnoremap <silent> <leader>b :call FZFSmartOpen(":Buffers")<CR>

" use <CTRL+GBC> to show buffer commits in FZF
nnoremap <silent> <leader>gbc :call FZFSmartOpen(":BCommits")<CR>

" use <CTRL+GC> to show commits in FZF
nnoremap <silent> <leader>gc :call FZFSmartOpen(":Commits")<CR>

" use <CTRL+F> to show files in FZF
nnoremap <silent> <leader>f :call FZFSmartOpen(":Files")<CR>

" use <CTRL+RG> to show ripgrep (Rg) in FZF
nnoremap <silent> <leader>rg :call FZFSmartOpen(":Rg")<CR>
