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

" Not sure, need to research
set shortmess+=c
