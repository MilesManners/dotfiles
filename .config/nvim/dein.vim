" Directory where Dein is/should be installed
let g:dein_dir=g:plugin_dir . '/repos/github.com/Shougo/dein.vim'

" Check if Dein directory exists
if (!isdirectory(expand(g:dein_dir)))
  " Create Dein directory
  call mkdir(g:dein_dir, 'p')
  " Clone Dein from Github
  call system('git clone https://github.com/Shougo/dein.vim '.g:dein_dir)
endif

" Add the Dein installation directory into runtimepath
let &rtp.=','.g:dein_dir

if dein#load_state(g:plugin_dir)
  call dein#begin(g:plugin_dir)

  " Load Dein
  call dein#add('Shougo/dein.vim')

  " Load plugins from seperate config file
  exec 'silent source ' . g:config_dir . 'plugins.vim'

  call dein#end()
  call dein#save_state()
endif

" Auto install plugins
if dein#check_install()
  call dein#install()
endif
