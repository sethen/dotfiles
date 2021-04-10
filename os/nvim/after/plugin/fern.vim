function! s:init_fern() abort
  setlocal nonumber
  setlocal norelativenumber
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
