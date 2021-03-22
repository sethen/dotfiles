function! CheckBackSpace()
	let col = col('.') - 1

	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : CheckBackSpace() ? "\<tab>" : coc#refresh()
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
nmap <leader>rn <Plug>(coc-rename)
