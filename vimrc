"===========================================
"               Carl's .vimrc
"===========================================

source ~/.vim/util.vim " For Old_vim_version function

" ========== Pluggins ========== {{{

call plug#begin()
Plug 'dstein64/vim-startuptime'
" " Eyecandy....
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'powerman/vim-plugin-AnsiEsc'
" " Navigation tools
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'unblevable/quick-scope'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'jpalardy/vim-slime', {'branch': 'main'}
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
" Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-signify' " Git/SVN
Plug 'kshenoy/vim-signature' " Marks
Plug 'junegunn/vim-easy-align'
" Plug 'salsifis/vim-transpose'
" For better diffs. Sometimes...
Plug 'chrisbra/vim-diff-enhanced'
Plug 'lambdalisue/vim-unified-diff'
Plug 'christoomey/vim-conflicted'

" Language support
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'wlangstroth/vim-racket'
" Plug 'bakpakin/fennel.vim'
Plug 'jaawerth/fennel.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'habamax/vim-godot'
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'LnL7/vim-nix'
Plug 'janet-lang/janet.vim'
Plug 'fatih/vim-go', {'for': 'go'}

call plug#end()
"}}}

" ============ General settings ============= {{{

"Disable vi support
"Some features don't work otherwise
set nocompatible

" Source sensible.vim plugin so we can override settings
runtime! plugin/sensible.vim

"Enable hidden buffers
set hidden

set encoding=utf-8

"Disable the swapfile and backups
set noswapfile
set nobackup

"Automatically load vimrc after saving
autocmd! bufwritepost ~/.vimrc source %

"Automatically run syntax checks on saving
" autocmd! BufWritePost * Neomake

au FileType txt,wiki set tw=80 spell

filetype plugin indent on

au BufRead,BufNewFile *.lib* set filetype=liberty
au BufRead,BufNewFile *.obliv* set filetype=yaml

"Allow mouse support
set mouse=a

set clipboard=unnamedplus

"Set leader key to ','
let mapleader=' '
let maplocalleader = "\\"

"Turn on line numbers
set number

"don't redraw whle executing macros, for performance
set lazyredraw

"Don't wrap lines
" set nowrap

" hide the netrw banner
let g:netrw_banner=0
" don't show hidden files by default. gh to show
let g:netrw_list_hide='^\..*'
let g:netrw_hide=1
let g:netrw_liststyle=3

"Show some nonprinting characters
set list lcs=tab:»·,eol:¬

" set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

set completeopt-=preview

"Folding method
set foldmethod=marker
" set foldlevelstart=0 " Just for forcing us to learn folds...

set ignorecase
set smartcase


" Use python from a conda environment
" let g:python3_host_prog = $HOME . '/.local/share/miniconda3/envs/neovim/bin/python'
let $PATH .= ':' . $HOME . '/.local/share/miniconda3/envs/neovim/bin'

if !Old_vim_version()
    set nofixendofline
endif

set cursorline

colorscheme molokai
highlight Normal ctermbg=None

" Revert molokai change that makes matching parenthesis hard to read
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
"}}}

" =========== Plugin settings ============== {{{

source ~/.vim/plugconfig/airline.vim
source ~/.vim/plugconfig/fzf.vim
source ~/.vim/plugconfig/autopairs.vim
source ~/.vim/plugconfig/better-whitespace.vim

let g:task_rc_override = 'rc.defaultwidth=0'

"Quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"slimv configuration
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

"}}}

" =========== Keyboard mappings ============ {{{

"Make it so we don't have to press shift when entering command mode
nnoremap ; :
vnoremap ; :

inoremap jk <ESC>

"Saving keybinds
:nnoremap <C-s> :w<CR>
:inoremap <C-s> <ESC>:w<CR>a

"space in normal mode toggles folding
" nnoremap <space> za
nnoremap ZO zO
nnoremap ZC zC
nnoremap ZM zM
nnoremap ZR zR

"switch to indent folding
nnoremap <leader>fi :set foldmethod=indent<CR>
"switch to marker folding
nnoremap <leader>fm :set foldmethod=marker<CR>

"edit a file in new tab INTENTIONAL WHITESPACE
:nnoremap <leader>t :tabe 

"switch between buffers
:nnoremap <leader>n :bp<CR>
:nnoremap <leader>m :bn<CR>

"close buffer
" :nnoremap <leader>q :bd<CR>
" nmap <space> <leader>

"move beween windows
:nnoremap <C-k> <C-w>k
:nnoremap <C-j> <C-w>j
 "Requires terminal patch for nvim:
:nnoremap <C-h> <C-w>h
:nnoremap <C-l> <C-w>l
:nnoremap <C-\<> 5<C-w><
:nnoremap <C-\>> 5<C-w>>

"Move line up or down
" nnoremap - ddp
" nnoremap _ ddkP

"Join line above (like J)
" nnoremap K ddkPJ

"change function parameter
nnoremap cp ct,

"Move to begining and end of line
nnoremap H ^
nnoremap L $

"Insert newlines without leaving normal mode
"nnoremap <S-CR> O<Esc> Doesn't work....
" nnoremap <C-M> o<Esc>
nnoremap - o<ESC>
nnoremap _ O<ESC>

"Edit vimrc in new tab
nnoremap <leader>ev :tabe $MYVIMRC<cr>

nnoremap <F1> :e.<cr>
nnoremap <F2> :UndotreeToggle<cr>
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F8> :TagbarToggle<cr>

"syntax checking
" nnoremap <leader>sc :SyntasticCheck<CR>
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'


" Close current tab
nnoremap <leader>tq :tabc<CR>


"Toggle spelling
nnoremap <leader>sp :set spell!<CR>

"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"append a period to the end of a line.
:nnoremap <leader>. A.<esc>0
"Capitalize current word in insert mode.
:inoremap <c-c> <esc>g~iwea

"put space around operator
nnoremap <leader><space> i <esc>la <esc>h

nmap <leader>) ysa))a
nmap <leader>be ysa))abegin<CR>

"abbreviations (auto insert/correct text)
iabbrev tehn then
iabbrev incldue include
iabbrev enld endl
iabbrev teh the
iabbrev fitlers filters
iabbrev fitler filter
iabbrev Fitler Filter
iabbrev Fitlers Filters

nnoremap <leader>now :read !date<cr>

" Wrap text
vnoremap Q gq
nnoremap Q gqap

nnoremap <leader>pb Oimport pdb; pdb.set_trace()<Esc>^
nnoremap <leader>pdb Oimport pudb; pu.db<Esc>^

nnoremap <leader>ct :!ctags -R src<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
"}}}

" =============== Functions ================ {{{

function! Header_guard(var)
    put ='#ifndef __' . a:var . '__'
    put ='#define __' . a:var . '__'
    put =''
    put =''
    put ='#endif /* __' . a:var . '__ */'
endfunction

"}}}

if filereadable(expand('~/.vimrc_work'))
	exe "source " . expand("~/.vimrc_work")
endif

" vim: set foldmethod=marker:
