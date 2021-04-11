let g:fern#renderer = 'nerdfont'

augroup FernPalette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END
