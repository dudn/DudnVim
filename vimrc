call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/vim-operator-highlight'
Plug 'vim-scripts/vim-auto-save'
Plug 'gorodinskiy/vim-coloresque'
Plug 'rking/ag.vim', { 'do': 'sudo apt install silversearcher-ag' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'majutsushi/tagbar' " o <Enter>
Plug 'anyakichi/vim-surround' " ds cs ysw ysiw
Plug 'tpope/vim-repeat' " . for vim-surround
Plug 'Lokaltog/vim-easymotion' " 's' or <leader><leader>j/k
Plug 'terryma/vim-multiple-cursors' " <C-x><C-p><C-n>
Plug 'tpope/vim-commentary' " gcc gc
Plug 'mattn/emmet-vim' "for quick generate html tree
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips' " <leader><tab>
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
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

" autofomat
noremap <F3> :Autoformat<CR>

" ycm
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_semantic_triggers =  {
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \ }
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax= 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" snippets
let g:UltiSnipsExpandTrigger = '<leader><Tab>'
let g:UltiSnipsJumpForwardTrigger = '<leader><Tab>'

" autosave
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

