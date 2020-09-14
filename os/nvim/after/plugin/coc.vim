" use <TAB> to go forward through autocomplete options
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ helpers#coc#CheckBackSpace() ? "\<TAB>" :
	\ coc#refresh()
" use <SHIFT-TAB> to go backward through autocomplete results
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
