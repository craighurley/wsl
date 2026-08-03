" Colors
syntax on                       " enable syntax processing
set background=dark
colorscheme habamax

" Misc
set ttyfast                     " faster redraw
set updatetime=500              " increase the response time
set backspace=indent,eol,start
set clipboard=unnamed           " enable copying to system clipboard
set shortmess+=I                " remove startup message when no file is selected
set mouse=v

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Backup and swap files
set nobackup
set noswapfile

" Spaces & Tabs
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
set autoindent
set nowrap
set nolist

" UI Layout
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set scrolloff=3         " always show at least 5 lines above/below the cursor
set sidescrolloff=3     " always show at least 5 characters left/right of the cursor
"set colorcolumn=80

" Status line
set laststatus=2
set statusline=
set statusline=%F                                   " filename
set statusline+=%=                                  " left/right separator
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}    " file encoding
set statusline+=\ %{&ff}                            " file format
set statusline+=\ %{strlen(&ft)?&ft:'none'}]        " filetype
set statusline+=\ %c                                " cursor column
set statusline+=\ %l/%L                             " cursor line/total lines
set statusline+=\ %P                                " percent through file

" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set nowrapscan          " do not wrap around
highlight Search ctermbg=black ctermfg=red cterm=underline

" Splits
set splitbelow
set splitright

" Folding
set nofoldenable        " don't fold files by default on open
set foldmethod=indent   " fold based on indent level
set foldlevelstart=1    " start with fold level of 1
set foldnestmax=10      " max 10 depth
