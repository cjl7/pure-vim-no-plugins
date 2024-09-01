set nu
set nocompatible
set background=dark
set modeline
syn enable
set pastetoggle=<F3>
let mapleader = ","

" backup dir
if !isdirectory($HOME."/.vim-backup-dir")
call mkdir($HOME."/.vim-backup-dir", "", 0700)
endif
set backupdir=~/.vim-backup-dir
set backup      " keep a backup file (restore to previous version)

" Let's save undo info!
if !isdirectory($HOME."/.vim-undo-dir")
call mkdir($HOME."/.vim-undo-dir", "", 0700)
endif
set undodir=~/.vim-undo-dir

set undofile        " keep an undo file (undo changes after closing)
set history=50      " keep 50 lines of command line history
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set nohlsearch

" tabs are out
set tabstop=4 shiftwidth=4 expandtab

" vim fuzzy search
set path+=**
set wildmenu

" turn on omnisearch
set omnifunc=syntaxcomplete#Complete

" hint to html what to indent besides whats included
:let g:html_indent_inctags = "html,body,tbody"

" use 80 chars for text
au BufRead,BufNewFile *.md setlocal textwidth=79
au BufRead,BufNewFile *.tex setlocal textwidth=79
au BufRead,BufNewFile *.txt setlocal textwidth=79

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif
endif

" Create tags file
" Use universal-ctags if you can.
command! MakeTags !ctags -R .

" Vexplore at your fingertips
nmap <F9> :Vex<CR>

" yaml editing
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
