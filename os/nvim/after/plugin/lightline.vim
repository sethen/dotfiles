function! IsHelpFileType()
	return &ft =~ 'help'
endfunction

function! IsFernFileType()
	return &ft =~ 'fern'
endfunction

function! IsStartifyFileType()
	return &ft =~ 'startify'
endfunction

function! IsQuickFixFileType()
	return &ft =~ 'qf'
endfunction

function! IsIgnoringStatus()
	return IsHelpFileType() || IsFernFileType() || IsStartifyFileType() || IsQuickFixFileType()
endfunction

function! LightlineCocGitBlame()
	if IsIgnoringStatus()
		return ''
	endif

	return winwidth(0) > 70 ? get(b:, 'coc_git_blame', '') : ''
endfunction

function! LightlineEncoding()
	if IsIgnoringStatus()
		return ''
	endif

	return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! LightlineFileName()
	let l:filename = expand('%t')

	if l:filename == '' && &ft == ''
		return WebDevIconsGetFileTypeSymbol() . ' [No Name]' . LightlineModified()
	endif

	if IsQuickFixFileType()
		return WebDevIconsGetFileTypeSymbol() . ' quickfix'
	endif

	if IsFernFileType()
		return "\uF829" . ' ' . &ft
	endif

	if IsHelpFileType()
		return "\uF595" . ' ' . &ft
	endif

	if IsStartifyFileType()
		return "\uF73C" . ' ' . &ft
	endif

	return WebDevIconsGetFileTypeSymbol() . ' ' . l:filename . LightlineModified()
endfunction

function! LightlineGitBranch()
	let l:filename = expand('%t')
	let l:gitbranch = fugitive#head()

	if IsIgnoringStatus() || l:filename == '' || l:gitbranch == ''
		return ''
	endif

	return "\uE725" . ' ' . l:gitbranch
endfunction

function! LightlineLineInfo()
	if IsIgnoringStatus()
		return ''
	endif

	return printf('%d:%-2d', line('.'), col('.'))
endfunction

function! LightlineMode()
	if IsIgnoringStatus()
		return ''
	endif

	return lightline#mode()
endfunction

function! LightlineModified()
	if IsIgnoringStatus()
		return ''
	endif

	if !&modifiable
		return ' -'
	endif

	if &modified
		return ' +'
	endif

	return ''
endfunction

function! LightlineReadOnly()
	if IsIgnoringStatus()
		return ''
	endif

	return &readonly ? 'ro' : ''
endfunction

let g:lightline = {
\  'colorscheme': 'material',
\  'component_function': {
\    'fileencoding': 'LightlineEncoding',
\    'filename': 'LightlineFileName',
\    'gitblame': 'LightlineCocGitBlame',
\    'gitbranch': 'LightlineGitBranch',
\    'lineinfo': 'LightlineLineInfo',
\    'mode': 'LightlineMode',
\    'readonly': 'LightlineReadOnly',
\  },
\  'active': {
\    'left': [
\      [ 'mode' ],
\      [ 'filename', 'gitbranch', 'readonly' ],
\    ],
\    'right': [
\      [ 'lineinfo', 'percent' ],
\      [],
\      [ 'gitblame', 'fileencoding' ],
\    ],
\  },
\  'inactive': {
\    'left': [
\      [ 'mode' ],
\      [ 'filename', 'gitbranch' ],
\    ],
\    'right': [
\      [ 'lineinfo', 'percent' ],
\    ]
\  }
\}
