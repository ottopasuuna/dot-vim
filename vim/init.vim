source ~/.vimrc

" no call to plug#begin as that will reset pluggins added in ~/.vimrc
Plug 'junegunn/vim-peekaboo'
Plug 'Olical/conjure', {'tag': 'v4.40.0'}
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'benekastah/neomake',
Plug 'rhysd/git-messenger.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki/'
Plug 'epwalsh/obsidian.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'PaterJason/cmp-conjure'
Plug 'bydlw98/cmp-env'
Plug 'quangnguyen30192/cmp-nvim-tags'

Plug 'L3MON4D3/LuaSnip'
Plug 'Yggdroot/indentLine'
call plug#end()


" source ~/.vim/plugconfig/neocomplete.vim
source ~/.vim/plugconfig/neomake.vim
source ~/.vim/plugconfig/conjure.vim
" source ~/.vim/plugconfig/vim-lsp.vim
source ~/.vim/plugconfig/vimwiki.vim
source ~/.vim/plugconfig/vim-go.vim
source ~/.vim/plugconfig/indentline.vim
source ~/.vim/plugconfig/gutentags.vim
source ~/.vim/plugconfig/tmuxline.vim
" luafile ~/obsidian.lua
" set completeopt=menu,menuone,noselect
" luafile ~/.vim/plugconfig/nvim-cmp.lua
" luafile ~/.vim/plugconfig/nvim-lspconfig.lua

luafile ~/.vim/lua/user/init.lua

au TextYankPost * silent! lua vim.highlight.on_yank({on_visual=true,timeout=150})
