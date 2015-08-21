" Not sure what this does...
set nocompatible

" Shows the command that is currently being typed
set showcmd

" Autoindent
set autoindent

" Use spaces instead of tabs
set expandtab " insert whitespaces when tab is pressed. Enter a real tab character: Ctrl-V <Tab>
set smarttab " Uses the shiftwidth setting for inserting <Tab> instead of tabstop setting  
set softtabstop=4 " Deletes four spaces at a time

" Set tab = 4 spaces
set smartindent " 
set tabstop=4 " controls the number of space characters inserted for a tab
set shiftwidth=4 " changes the number of space characters inserted for indentation
" note: do :retab to change all existing tab characters to current tab settings

" For python: adds a <TAB> key to the end when you type a colon followed by a return
" im :<CR> :<CR><TAB>

" Remove trailing whitespaces at the end of lines  <--- does not work :(
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Show line number
set number

" For detecting file types and highlighting
filetype on
filetype indent on
filetype plugin on
syntax enable

" Tab completion when entering commands
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console <-- does not work
set mouse=a
set ttymouse=xterm

" Set backspace over everything in insert mode
set backspace=2

" Ignore cases / plus dealing with exceptions of smartcase for *, #
set ignorecase
set smartcase " case sensitive when the pattern contains uppercase letter; does not apply to *, #, gd
	      " * search forward for the next occurence of this word Word
	      " # search backward for the previous occurence of this word Word
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Start searching when you start typing. As you type in more characters, search is refined.
set incsearch

" Highlight results of search
set hlsearch

" Display the status line, which includes current mode, file name, file
" status, ruler etc.
set laststatus=2

" Super sweet status line
" More info here:
" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Turn off the bell sound
set vb

" Makes sure each windows contains a status line <-- not sure if this works
set ruler

" Centers screen on next/previous selection
map n nzz
map N Nzz

" Map the <jj> to <ESC>
inoremap jj <ESC>

" Map the <space> to <colon>
nmap <space> :

" Map leader key to space
let mapleader=";"

" Faster shortcut for commenting. Requires tcomment plugin
map <leader>c <c-_><c-_>

" Map the arrow keys to do nothing
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Map ;e to run python script
map :e :w<CR>:!python %<CR>

set showmatch " Show matching brackets
set mat=5 " bracket blinking
set novisualbell  " No blinking
set noerrorbells  " No noise

" Latex related
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" compile to pdf                              
let g:Tex_DefaultTargetFormat = 'pdf' 

" map compile and launch pdf to other keys
map <space>j <leader>ll 
map <space>k <leader>lv 

" pdf compile and view settings                                
let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_CompileRule_pdf = 'latexmk -pdf'

" Acknowledgement:
" All of the above is referenced from the web. Thanks to the many great people
" who contributed online!
