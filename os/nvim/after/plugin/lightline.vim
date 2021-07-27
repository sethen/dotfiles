function! IsNerdTreeFileType()
	return &ft =~ 'nerdtree'
endfunction

function! IsHelpFileType()
	return &ft =~ 'help'
endfunction

function! IsQuickFixFileType()
	return &ft =~ 'qf'
endfunction

function! IsStartifyFileType()
	return &ft =~ 'startify'
endfunction

function! IsPackerFileType()
	return &ft =~ 'packer'
endfunction

function! IsIgnoringStatus()
	return IsHelpFileType() || IsNerdTreeFileType() || IsStartifyFileType() || IsQuickFixFileType() || IsPackerFileType()
endfunction

function! LightlineEncoding()
	if IsIgnoringStatus()
		return ''
	endif

	return &fileencoding
endfunction

function! LightlineFileformat()
	if IsIgnoringStatus()
		return ''
	endif

	return &ff
endfunction

function! LightlineFileType()
	if IsIgnoringStatus()
		return ''
	endif

	return WebDevIconsGetFileTypeSymbol() . ' ' . &ft
endfunction

function! LightlineFileName()
	let l:filename = expand('%:t')

	if l:filename == '' && &ft == ''
		return '[No Name]' . LightlineModified()
	endif

	if IsPackerFileType()
		return "\uF595" . ' ' . &ft
	endif

	if IsQuickFixFileType()
		return "\uF976" . ' ' . &ft
	endif

	if IsNerdTreeFileType()
		return "\uf752" . ' ' . &ft
	endif

	if IsHelpFileType()
		return "\uFAD9" . ' ' . &ft
	endif

	if IsStartifyFileType()
		return "\uF73C" . ' ' . &ft
	endif

	return l:filename . LightlineModified()
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
\    'fileformat': 'LightlineFileformat',
\    'filetype': 'LightlineFileType',
\    'gitbranch': 'LightlineGitBranch',
\    'lineinfo': 'LightlineLineInfo',
\    'mode': 'LightlineMode',
\    'readonly': 'LightlineReadOnly',
\  },
\  'active': {
\    'left': [
\      [ 'mode' ],
\      [ 'gitbranch', 'filename', 'readonly' ]
\    ],
\    'right': [
\      [ 'lineinfo', 'percent' ],
\      [],
\      [ 'filetype', 'fileencoding', 'fileformat' ]
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
