source ~/.vimrc

" no call to plug#begin as that will reset pluggins added in ~/.vimrc
Plug 'junegunn/vim-peekaboo'
Plug 'Olical/conjure', {'tag': 'v4.43.0'}
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
" Plug 'benekastah/neomake',
Plug 'rhysd/git-messenger.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki/'
Plug 'epwalsh/obsidian.nvim'
Plug 'tools-life/taskwiki'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'PaterJason/cmp-conjure'
Plug 'bydlw98/cmp-env'
Plug 'quangnguyen30192/cmp-nvim-tags'

Plug 'L3MON4D3/LuaSnip'
Plug 'Yggdroot/indentLine'
call plug#end()


" source ~/.vim/plugconfig/neomake.vim
source ~/.vim/plugconfig/vim-go.vim
source ~/.vim/plugconfig/indentline.vim
source ~/.vim/plugconfig/gutentags.vim

luafile ~/.vim/lua/user/init.lua
set mouse=a
set clipboard=unnamedplus
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_taskrc_location = '.config/task/taskrc'
