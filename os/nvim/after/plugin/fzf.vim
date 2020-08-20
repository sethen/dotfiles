" customize the Rg command for searching
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \ fzf#vim#with_preview(), <bang>0)
