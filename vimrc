"===========================================
"               Carl's .vimrc
"===========================================

function! s:old_vim_version()
	return !has('nvim') && v:version < 800
endfunction
" ========== Pluggins ========== {{{

call plug#begin()
Plug 'dstein64/vim-startuptime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', {'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'wlangstroth/vim-racket'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
" Plug 'edkolev/tmuxline.vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'unblevable/quick-scope'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
" Plug 'mattn/emmet-vim'
" Plug 'blindFS/vim-taskwarrior'
Plug 'vimwiki/vimwiki/'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-signify'
" Plug 'bling/vim-bufferline'
Plug 'yegappan/greplace'
Plug 'Yggdroot/indentLine'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'lambdalisue/vim-unified-diff'
Plug 'christoomey/vim-conflicted'
Plug 'janko/vim-test'
Plug 'benmills/vimux'
if s:old_vim_version()
    if has('+lua')
        Plug 'Shougo/neocomplete.vim'
    endif
	Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
else
	Plug 'prabirshrestha/async.vim'
	" Plug 'dense-analysis/ale'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
	" Plug 'lighttiger2505/deoplete-vim-lsp'
	" Plug 'zchee/deoplete-clang'
	Plug 'zchee/deoplete-jedi', {'for': 'python'}
	Plug 'davidhalter/jedi-vim', {'for': 'python'}
	" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
	" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
	let g:jedi#auto_initialization=1
	let g:jedi#auto_vim_configuration=1
    let g:jedi#completions_enabled = 0
    Plug 'benekastah/neomake',
    Plug 'rhysd/git-messenger.vim'
	Plug 'liuchengxu/vista.vim'
    " Plug 'puremourning/vimspector'
endif

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
autocmd! BufWritePost * Neomake

au FileType txt set tw=80 spell

filetype plugin indent on

au BufRead,BufNewFile *.lib.* set filetype=liberty

"Allow mouse support
set mouse=a

set clipboard=unnamedplus

"Set leader key to ','
let mapleader=','
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
set foldmethod=indent
set foldlevelstart=0 " Just for forcing us to learn folds...


" Use python from a conda environment
let g:python3_host_prog = $HOME . '/.local/share/miniconda3/envs/neovim/bin/python'
let $PATH .= ':' . $HOME . '/.local/share/miniconda3/envs/neovim/bin'

if !s:old_vim_version()
    set nofixendofline
endif

set cursorline

colorscheme molokai
highlight Normal ctermbg=None

" Revert molokai change that makes matching parenthesis hard to read
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
"}}}

" =========== Plugin settings ============== {{{

" turn on vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" Hide vim's default mode indicator
set noshowmode


let g:tmuxline_preset = {
    \'a' : '#S',
    \'win' : ['#I #W'],
    \'cwin' : ['#I:#P #W'],
    \'y' : '%H:%M|%b%d',
    \'z' : ['#(whoami)@#H'],
    \'options' : {'status-justify' : 'left'}}

let g:task_rc_override = 'rc.defaultwidth=0'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

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
  \ 'header':  ['fg', 'Comment'] }"Neomake

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
    call neomake#configure#automake('rnw', 200)
endif

" Disable virtual text for now because it gets too distracting
let g:neomake_virtualtext_current_error = 0

"neocomplete/deoplete
if !s:old_vim_version()
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

" set gutentags cache directory
" let g:gutentags_cache_dir = '~/.cache/gutentags'

" Use markdown syntax for vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{'path': '~/vimwiki/' }]

"slimv configuration
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

let test#strategy = "vimux"

" Language Server Protocol setup
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " setlocal omnifunc=lsp#complete
    " setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> <leader>r <plug>(lsp-rename)
    nmap <buffer> K <plug>(lsp-hover)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 0
let g:lsp_highlight_references_enabled = 1
highlight lspReference ctermfg=white guifg=white ctermbg=black guibg=black

let g:git_messenger_always_into_popup = 1

let scheme_autopairs = {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
au BufRead *.scm let b:AutoPairs = scheme_autopairs
au BufRead *.rkt let b:AutoPairs = scheme_autopairs

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"}}}

" =========== Keyboard mappings ============ {{{

"Make it so we don't have to press shift when entering command mode
nnoremap ; :
vnoremap ; :

inoremap jk <ESC>
if has('nvim')
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
endif

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
nmap <space> <leader>

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

"Bind for fzf
nnoremap <C-p><C-f> :Files<CR>
nnoremap <C-p><C-p> :GFiles<CR>
nnoremap <C-p><C-b> :Buffers<CR>
nnoremap <C-p><C-t> :Tags<CR>
nnoremap <C-p><C-g> :BTags<CR>
nnoremap <C-p><C-r> :Rg

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
nnoremap <F5> :Neomake!<CR>
if !s:old_vim_version()
	nnoremap <F8> :Vista!!<cr>
else
	nnoremap <F8> :TagbarToggle<cr>
endif

"syntax checking
" nnoremap <leader>sc :SyntasticCheck<CR>
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

"Git add and commit
" nnoremap <leader>gc :Git commit -a
" Open git fugitive status in new tab
nnoremap <leader>gs :tabe<CR>:Gstatus<CR>


"Toggle spelling
nnoremap <leader>sp :set spell!<CR>

"better-whitespace plugin:
:nnoremap <leader>w :ToggleWhitespace<cr>
:nnoremap <leader>sw :StripWhitespace<cr>
let g:better_whitespace_filetypes_blacklist=['txt']


"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"append a period to the end of a line.
:nnoremap <leader>. A.<esc>0
"Capitalize current word in insert mode.
:inoremap <c-c> <esc>g~iwea

"put space around operator
nnoremap <leader><space> i <esc>la <esc>h

"Git/fugitive hotkeys
nnoremap <leader>gc :Git commit -a<CR>

nmap <leader>) ysa))a

"abbreviations (auto insert/correct text)
iabbrev tehn then
iabbrev incldue include
iabbrev enld endl
iabbrev teh the

" Wrap text
vnoremap Q gq
nnoremap Q gqap

nnoremap <leader>pb Oimport pdb; pdb.set_trace()<Esc>^

nnoremap <leader>ct :!ctags -R src<CR>

"Run Unit tests
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tl :TestLast<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
"}}}

" =============== Functions ================ {{{

"settings for unite interface
function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

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
