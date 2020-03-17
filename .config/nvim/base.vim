" Base configuration

" Enable colors
if has('termguicolors')
  set termguicolors
endif

" Preview substitution
set is
set inc=nosplit

" Hide mode in statusline
set noshowmode

" File navigation
let g:netrw_banner=0
let g:netrw_liststyle=3

" Not sure, need to research
set shortmess+=c
