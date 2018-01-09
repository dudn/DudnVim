call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/vim-auto-save'
Plug 'Valloric/vim-operator-highlight'
Plug 'rking/ag.vim', { 'do': 'sudo apt install silversearcher-ag' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'anyakichi/vim-surround' " ds cs ysw ysiw
Plug 'tpope/vim-repeat' " . for vim-surround
Plug 'Lokaltog/vim-easymotion' " 's' or <leader><leader>j/k
Plug 'terryma/vim-multiple-cursors' " <C-x><C-p><C-n>
Plug 'tpope/vim-commentary' " gcc gc
Plug 'mattn/emmet-vim' "for quick generate html tree
Plug 'kien/ctrlp.vim'

Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
call plug#end()

filetype plugin indent on
" mkdir dir before using
set undodir=~/tmp

colorscheme gruvbox
set background=dark
set number
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
set bs=indent,eol,start
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
" set textwidth=80
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

nnoremap <Leader>q :wqa<cr>

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

" FUNCTIONS

" tagbar
noremap <F8> :TagbarToggle<CR>
" <Space> conflict with <leader>,cancel it
let g:tagbar_map_showproto=""

" easymotion
" noremap dont work
map s <Plug>(easymotion-s)

" ctrlp
let g:ag_working_path_mode="r"
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

let g:ale_linters = {
\   'html':['htmlhint', 'csslint', 'jshint'],
\   'javascript': ['jshint'],
\   'css':['csslint'],
\}

" autofomat invoke outside tools #js-beautify(css-beautify) html-beautify astyle
noremap <F3> :Autoformat<CR>

" autosave
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" ale
let g:ale_sign_column_always = 1
