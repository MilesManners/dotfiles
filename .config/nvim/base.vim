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

" Update more often
set updatetime=100
" Save in the same amount of time
set updatecount=8000

" Not sure, need to research
set shortmess+=c
