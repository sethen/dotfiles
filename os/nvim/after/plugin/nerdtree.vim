let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeMinimalUI = 1

autocmd FileType nerdtree nmap <buffer> l o
autocmd FileType nerdtree silent nmap <buffer> h x
nnoremap <expr><silent> <leader><leader> exists("g:NERDTree") && g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : ':NERDTree<CR>'
