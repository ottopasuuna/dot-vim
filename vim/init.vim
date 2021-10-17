source ~/.vimrc

" no call to plug#begin as that will reset pluggins added in ~/.vimrc
Plug 'junegunn/vim-peekaboo'
Plug 'Olical/conjure', {'tag': 'v4.25.0', 'for': ['fennel', 'racket', 'clojure']}
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'benekastah/neomake',
Plug 'rhysd/git-messenger.vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki/'
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'janko/vim-test'
Plug 'benmills/vimux'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
" Plug 'puremourning/vimspector'
call plug#end()

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
let g:vista_executive_for = {
  \ 'python': 'vim_lsp',
  \ }
let g:highlightedyank_highlight_duration = 350
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

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
