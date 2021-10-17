
function! Old_vim_version()
	return !has('nvim') && v:version < 800
endfunction
