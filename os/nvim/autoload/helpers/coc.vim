function helpers#coc#CheckBackSpace()
	let col = col('.') - 1

	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

