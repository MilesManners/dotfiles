" Plugins

" Language
call dein#add('sheerun/vim-polyglot')

" Completion
if has('nvim')
  call dein#add('neoclide/coc.nvim', { 'merged':0, 'rev': 'release' })
endif
call dein#add('mattn/emmet-vim')

" Code Display
call dein#add('frazrepo/vim-rainbow')
call dein#add('lewis6991/moonlight.vim')

" Integrations
call dein#add('tpope/vim-fugitive')

" Interface
call dein#add('itchyny/lightline.vim')
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')

" Commands
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')

" Other
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-sleuth')
