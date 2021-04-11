let g:coc_global_extensions = [
\  'coc-css',
\  'coc-eslint',
\  'coc-highlight',
\  'coc-html',
\  'coc-json',
\  'coc-pairs',
\  'coc-solargraph',
\  'coc-rls',
\  'coc-snippets',
\  'coc-tabnine',
\  'coc-tsserver',
\  'coc-vimlsp',
\  'coc-yaml'
\]

function! CheckBackSpace()
	let col = col('.') - 1

	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : CheckBackSpace() ? "\<tab>" : coc#refresh()
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

