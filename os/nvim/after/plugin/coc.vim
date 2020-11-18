function! CheckBackSpace()
	let col = col('.') - 1

	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <TAB> to go forward through autocomplete options
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-N>" : CheckBackSpace() ? "\<TAB>" : coc#refresh()

" use <SHIFT+TAB> to go backward through autocomplete results
inoremap <expr> <S-TAB> pumvisible() ? "\<C-P>" : "\<C-H>"

" use <CTRL+J> to confirm completion 
inoremap <expr> <C-J> pumvisible() ? "\<C-Y>" : "\<CR>"
