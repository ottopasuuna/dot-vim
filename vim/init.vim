source ~/.vimrc

" no call to plug#begin as that will reset pluggins added in ~/.vimrc
Plug 'junegunn/vim-peekaboo'
" Plug 'Olical/conjure', {'tag': 'v4.32.0'}
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
" Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'benekastah/neomake',
Plug 'rhysd/git-messenger.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki/'
" Plug 'janko/vim-test'
" Plug 'benmills/vimux'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
" Plug 'puremourning/vimspector'
call plug#end()

let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,janet,fennel,racket'

source ~/.vim/plugconfig/neocomplete.vim
source ~/.vim/plugconfig/neomake.vim
source ~/.vim/plugconfig/conjure.vim
source ~/.vim/plugconfig/vim-lsp.vim
source ~/.vim/plugconfig/vimwiki.vim
source ~/.vim/plugconfig/vim-go.vim
source ~/.vim/plugconfig/indentline.vim
source ~/.vim/plugconfig/gutentags.vim
" source ~/.vim/plugconfig/tmuxline.vim

let test#strategy = "vimux"

let g:git_messenger_always_into_popup = 1
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:highlightedyank_highlight_duration = 350
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif


tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k



nnoremap <F5> :Neomake!<CR>

"Git/fugitive hotkeys
" Open git fugitive status in new tab
nnoremap <leader>gs :tabe<CR>:Git<CR>

"Run Unit tests
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tl :TestLast<CR>
