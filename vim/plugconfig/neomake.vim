"Neomake
let g:neomake_c_gcc_maker = {
   \ 'args': ['-Wall -Werror -pedantic'],
   \}

let g:neomake_c_enabled_makers = ['gcc']
let g:neomake_python_enabled_makers = ['python', 'pylint']

let g:neomake_warning_sign = {
   \ 'text': '⚠',
   \ 'texthl': 'WarningMsg',
   \ }
let g:neomake_error_sign = {
   \ 'text': '✗',
   \ 'texthl': 'ErrorMsg',
   \ }

" Run linters when reading and writing files, and normal mode changes
if exists('*neomake#configure#automake')
    call neomake#configure#automake('rnw', 100)
endif

" Disable virtual text for now because it gets too distracting
let g:neomake_virtualtext_current_error = 0
