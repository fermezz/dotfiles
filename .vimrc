" 
" Vim settings for @fermezz
"

" Settings in this file may depend on plugins, so let's install them first.
" Not to be confused with the contents of ~/.vim/plugin/* which are
" configuration options for each plugin and automatically loaded by Vim.
call plug#begin()
Plug 'tpope/vim-sensible'

" Makes de folding of functions works properly
Plug 'https://github.com/tmhedberg/SimpylFold'

" Check your syntax
Plug 'vim-syntastic/syntastic'

" Making python identation great
Plug 'vim-scripts/indentpython.vim'

" Color scheme plugins
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

" Powerline plugin
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

let python_highlight_all=1
syntax on

set path+=**                          " Adds ** to path so makes a recursive search when find command
set wildmenu                          " Display all matching files when tab complete
set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
:set autochdir                        " Change working directory to the one the present file belongs

" Setting up correct python PEP8 identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" And now frontend files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

" Ignoring files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")
set background=dark

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" Get off my lawn - helpful when learning Vim :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
