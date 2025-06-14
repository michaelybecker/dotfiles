let g:netrw_liststyle = 1           " Use simple list (1 = thin, 2 = wide)
let g:netrw_browse_split = 0        " Stay in same window for folders
let g:netrw_altv = 1                " Open files in vertical split
let g:netrw_winsize = 60

" autocmd FileType netrw setlocal winfixwidth
" autocmd FileType netrw vertical resize 25
" function! s:OpenNetrwLeft()
"   topleft vertical 25new
"   setlocal winfixwidth
"   execute 'Explore'
"   wincmd l
" endfunction

" autocmd VimEnter * call s:OpenNetrwLeft()

set splitright
set noequalalways

syntax enable

set history=9999
set undolevels=9999

" install vim-plug if nonexisting
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/seoul256.vim'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'sjl/gundo.vim'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'bronson/vim-trailing-whitespace'

  " search
  Plug 'easymotion/vim-easymotion'


  " Code Related
  Plug 'Raimondi/delimitMate'                                                     " Close matching parenthesis and the like
  Plug 'scrooloose/syntastic'                                                     " Syntax Checking


  " UI
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'flazz/vim-colorschemes'
  Plug 'kyuhi/vim-emoji-complete'
  Plug 'ryanoasis/vim-devicons'

  " Git
  Plug 'tpope/vim-fugitive'

call plug#end()


syntax enable
set termguicolors
" colorscheme monokai
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

" set background=dark

" Set 256 colors in vim
set t_Co=256

" Set the title of the terminal
set title
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

set ruler

set number
set relativenumber


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
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab "Converts tabs into space characters

" Textwrap at 80 haracters
set tw=80
set wrap

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc


" Indentation
set autoindent "Auto indent
set smartindent "Smart indent

se mouse+=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"Show editor mode
set showmode
set cmdheight=1

" clipboard interop
set clipboard=unnamedplus
set splitbelow
