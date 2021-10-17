let g:fzf_layout = {'down': '40%'}

function! s:close_buffers(lines)
    echom a:lines
    bp
    bd a:lines
endfunction
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-x': function('s:close_buffers')}


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"Bind for fzf
nnoremap <C-p><C-f> :Files<CR>
nnoremap <C-p><C-p> :GFiles<CR>
nnoremap <C-p><C-b> :Buffers<CR>
nnoremap <C-p><C-t> :Tags<CR>
nnoremap <C-p><C-g> :BTags<CR>
nnoremap <C-p><C-r> :Rg
