syntax enable

set history=9999
set undolevels=9999

inoremap jk <ESC>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.vim/plugged')
Plug 'nightsense/vrunchbang'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'sjl/gundo.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'


" Search
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'

" Buffers
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Tags
Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
Plug 'xolox/vim-misc'

" Motions
Plug 'Lokaltog/vim-easymotion'


" Code Related
Plug 'Raimondi/delimitMate'                                                     " Close matching parenthesis and the like
Plug 'jeetsukumaran/vim-indentwise'                                             " Move around in indents
Plug 'antoyo/vim-licenses'                                                      " FOSS Licensse
Plug 'scrooloose/syntastic'                                                     " Syntax Checking
Plug 'SirVer/ultisnips'                                                         " Tab Completion of entities
" Plug 'honza/vim-snippets'                                                       " Snippets of code
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' } " Code Completion
Plug 'tpope/vim-dispatch'                                                       " Compile Async
" Plug 'KabbAmine/zeavim.vim'
Plug 'editorconfig/editorconfig-vim'                                            " Different config for different languages


" UI
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'kyuhi/vim-emoji-complete'
Plug 'junegunn/vim-emoji'
" Plug 'vim-scripts/vim-webdevicons'


" Markdown
Plug 'vim-pandoc/vim-pantondoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" HTML
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/closetag.vim'
Plug 'vim-scripts/css_color'

" JS
" Plug 'marijnh/tern_for_vim' , {'do': 'npm install'}
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

" C-family
Plug 'chazy/cscope_maps'
Plug 'vim-scripts/IndentWise'

" Git
Plug 'tpope/vim-fugitive'

" Miscellaneous Tooling
Plug 'tmux-plugins/vim-tmux'
Plug 'neilagabriel/vim-geeknote'

call plug#end()


colorscheme monokai

" Set 256 colors in vim
set t_Co=256

" Set the title of the terminal
set title
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

"This is the most awesome configurationa ever, is shows both
"the absolute and relative numbering together to make jumps
"easier
set number
" set relativenumber
nnoremap <silent><leader>n :set relativenumber!<cr>


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Mark the current line
set cursorline

" For the vimdow
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Search Related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When searching try to be smart about cases
set smartcase
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding is enabled by default
set foldenable

" Only very nested blocks will be folded
set foldlevelstart=2 " 99 means everything will open up

" The maximum nesting level
set foldnestmax=10


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set fileencoding=utf-8
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Migrated to editorconfig
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab "Converts tabs into space characters

" Textwrap at 80 haracters
set tw=100
set wrap

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc


" Indentation
set autoindent "Auto indent
set smartindent "Smart indent

"Adding omnicomplete
set ofu=syntaxcomplete#Complete

se mouse+=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"Show editor mode
set showmode
set cmdheight=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gVIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GVim remove unnecessary borders
if has('gui_running')
  set go-=mr
  set go-=T
  set guifont=Sauce\ Code\ Powerline\ 13
  colorscheme solarized
  set background=light
endif

" Licenses
"""""""""""
let g:licenses_authors_name = 'Michael Hazani <michael@michaelhazani.com>'
let g:licenses_copyright_holders_name = 'Michael Hazani'


