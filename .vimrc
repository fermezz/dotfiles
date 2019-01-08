"
" Vim settings for @fermezz
"

" Settings in this file may depend on plugins, so let's install them first.
" Not to be confused with the contents of ~/.vim/plugin/* which are
" configuration options for each plugin and automatically loaded by Vim.
call plug#begin()

" tpope rocks
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-scripts/indentpython.vim'
Plug 'tell-k/vim-autopep8'
Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" YouCompleteMe plugin
" Plug 'Valloric/YouCompleteMe'

Plug 'terryma/vim-smooth-scroll'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ctags manager
Plug 'ludovicchabant/vim-gutentags', { 'branch': 'vim7' }

Plug 'ruanyl/vim-gh-line'
Plug 'zivyangll/git-blame.vim'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Leader Mappings
let g:mapleader = "\<Space>"

" Abbreviation for commands
ab ip import ipdb; ipdb.set_trace(context=10)

let python_highlight_all=1
let g:ale_python_pylint_options = '--load-plugins pylint_django'      " Making ale work with pylint-django
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
syntax on

set path+=**                          " Adds ** to path so makes a recursive search when find command
set wildmenu                          " Display all matching files when tab complete
set autoread                          " Auto reload changed files
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
" set autochdir                         " Change working directory to the one the present file belongs
filetype plugin on
runtime macros/matchit.vim


" Setting up correct python PEP8 identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set syntax=python |
    \ set filetype=python |

" And now frontend files
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Haskell config
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Config airline tabs
let g:airline#extensions#tabline#enabled = 1

" Start terminal mode in insert
nnoremap <C-t> :vs<CR>:terminal<CR>i
nnoremap <C-s><C-p> :sp<CR>:terminal<CR>i
tnoremap <C-t> exit<CR>

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Enable folding
set foldmethod=indent
set foldlevel=99

" NerdTreeToggle shortcut
" nnoremap <C-n> :NERDTreeToggle<cr>

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/
set wildignore+=*.pyc
set wildignore+=tags/
set wildignore+=tags*

" Ignoring files in NERDTree
" let NERDTreeIgnore=['\.pyc$', '\~$']


set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling
set relativenumber    " Displays the relative line number depending on what line you are standing on


" Colors and formatting.

" jellybeans rocks.
set background=dark
colorscheme jellybeans

" Showcase comments in italics
highlight Comment cterm=italic gui=italic term=italic,underline

" Quicker window movement
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split panes resize
nnoremap <silent> <Leader>V :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>v :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>H :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>h :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Smooth scrolling remap
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 3)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 3)<CR>

" Ultisnips remap
let g:UltiSnipsExpandTrigger       = '<C-x>'
let g:UltiSnipsJumpForwardTrigger  = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger = '<C-p>'
let g:UltiSnipsListSnippets        = '<C-k>' "List possible snippets based on current file

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!tags/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" Inside tmux
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" fzf mappings
let g:fzf_nvim_statusline = 1 " disable statusline overwriting

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Find ' . input('Find ')<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>
nnoremap <silent> <leader>json :%!python -m json.tool<CR>


" Cursor shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


" Compile and execute C++
nnoremap <Leader><C-z> :!g++ -o  %:r.out % -std=c++11<CR>
nnoremap <Leader><C-x> :!./%:r.out<CR>

" Execute single test file with pytest
let service = split(split('%', '/')[0]. '_')[0]
nnoremap <Leader>tcf :echo service<CR>
