" Base configuration

" Enable colors
if has('termguicolors')
  set termguicolors
endif

" Set ttyfast
if has ('ttyfast')
  set ttyfast
endif

" Preview substitution
set is
set icm=nosplit

" Ignore search case unless capital letters are used
set ignorecase
set smartcase

" Hide mode in statusline
set noshowmode

" File navigation
let g:netrw_banner=0
let g:netrw_liststyle=3

" Not sure, need to research
set shortmess+=c
