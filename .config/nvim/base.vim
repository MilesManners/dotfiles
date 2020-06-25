" Base configuration

" Enable colors
if has('termguicolors')
  set termguicolors
endif

" Set ttyfast
if has ('ttyfast')
  set ttyfast
endif

" TextEdit might fail if hidden is not set
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Preview substitution
set is
set icm=nosplit

" Ignore search case unless capital letters are used
set ignorecase
set smartcase

" Hide mode in statusline
set noshowmode

" Update more often
set updatetime=300

" Enable mouse
set mouse=a

" Highlight current line
set cursorline

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Code folding by syntax
set foldmethod=syntax
" Start file with all folds open
set foldlevelstart=99

" Fixes for plop.js
augroup plopfiles
  autocmd!
  au BufNewFile,BufRead *.ts.hbs set filetype=typescript.handlebars | set syntax=typescript
  au BufNewFile,BufRead *.tsx.hbs set filetype=typescriptreact.handlebars | set syntax=typescriptreact
  au BufNewFile,BufRead *.css.hbs set filetype=css.handlebars | set syntax=css
augroup end
