"neocomplete/deoplete
source ~/.vim/util.vim

if !Old_vim_version()
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#option({
        \ 'smart_case': 1,
        \ 'max_list': 25
        \ })
else
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#max_list = 25
endif
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
