" Don't try to be vi compatible
set nocompatible

" Fixes kitty terminal background changing on scroll
let &t_ut=''

" Check to see if Vim-Plug exists first
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'

call plug#end()

" TODO: Pick a leader key
let mapleader = " "

" Security
set modelines=0

" Show line numbers
" set number

" Disable default mode indicator (for airline)
set noshowmode

" Blink cursor on error instead of beeping (grr)
set visualbell

" Enable mouse scrolling
set mouse=a

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Last line
" set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

map <leader>l :set list!<CR> " Toggle tabs and EOL

map <leader>w :w<CR>
imap jj <ESC>
" Insert spaces below or above cursor in normal mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>


" Check to see if these directories exist
if empty(glob('~/.vim/.undo'))
  call mkdir($HOME . '/.vim/.undo/')
endif

if empty(glob('~/.vim/.backup'))
  call mkdir($HOME . '/.vim/.backup/')
endif

if empty(glob('~/.vim/.swap'))
  call mkdir($HOME . '/.vim/.swap/')
endif

set backup
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//

" Color scheme (terminal)
set t_Co=256
set background=dark

colorscheme dracula
let g:airline_theme='dracula'
let g:airline_section_y = 0
let g:airline#extensions#tabline#enabled = 1

" coc VIM stuff
" AUTOCOMPLETION - Tab to accept/navigate suggestions
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" This gives you VSCode-like autocomplete: type something, suggestions appear,

" Tab/Shift-Tab to navigate, Enter to accept
" Navigate diagnostics (errors/warnings) - equivalent to ALE's previous/next
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Goyo with Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
