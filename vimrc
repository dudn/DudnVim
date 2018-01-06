call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
" o <Enter>
Plug 'anyakichi/vim-surround'
" ds cs ysw ysiw
Plug 'Lokaltog/vim-easymotion'
" 's'
Plug 'terryma/vim-multiple-cursors'
" <C-x><C-p><C-n>
Plug 'tpope/vim-commentary'
" gcc gc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" :FZF
Plug 'rking/ag.vim', { 'do': 'sudo apt install silversearcher-ag' }
" :Ag
call plug#end()

filetype plugin indent on
" mkdir dir before using
set undodir=~/tmp

set number
set background=dark
set scrolloff=5
set showmode
set showcmd
set ruler
set title
set undofile
set cursorline
set winaltkeys=no
set wildmode=longest,list,full
set ignorecase
set smartcase
set autoindent
set copyindent
set smarttab
set magic
set nobackup
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set hidden
set history=1000
set undolevels=1000
set autoread
set foldlevelstart=99
set shortmess=a
set tags=./tags;/
set pastetoggle=<F7>
set whichwrap+=<,>,h,l
set viminfo='20,\"500
set textwidth=80
set incsearch

if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

augroup vimrc
    autocmd BufRead,BufWritePre,FileWritePre * silent! %s[\r \t]\+$//
augroup END
"==============================================================================
let mapleader=" "
inoremap we <Esc>
vnoremap we <Esc>

cnoremap w!! w !sudo tee % >/dev/null
cnoremap <c-j> <down>
cnoremap <c-k> <up>

nnoremap <leader>w :w!<cr>
nnoremap <Leader>q :qa<cr>

nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
vnoremap < <gv
vnoremap > >gv
nnoremap j gj
nnoremap k gk
nnoremap <c-j> 15gj
nnoremap <c-k> 15gk
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

noremap <F8> :TagbarToggle<CR>
" <Space> conflict with <leader>,cancel it
let g:tagbar_map_showproto=""
let g:ag_working_path_mode="r"
" noremap dont work
map s <Plug>(easymotion-s)
