" Slim config for loading plugins through dein

if &compatible
  set nocompatible
endif

" Change <leader> to <Space>
let mapleader="\<Space>"

" Helper function for creating directories if they don't exist
function EnsureDirectory(dir)
  if (!isdirectory(expand(a:dir)))
    call mkdir(a:dir, 'p')
  endif
  return a:dir
endfunction

" Directory for config files
" Use XDG_CONFIG_HOME if possible, otherwise default to HOME/.config
if empty($XDG_CONFIG_HOME)
  let g:config_dir=EnsureDirectory($HOME.'/.config/nvim/')
else
  let g:config_dir=EnsureDirectory($XDG_CONFIG_HOME.'/nvim/')
endif

" Basic configuration
exec 'silent source '.g:config_dir.'base.vim'

" Directory for plugins
let g:plugin_dir=EnsureDirectory($HOME.'/.cache/dein')

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
  call dein#load_toml(g:config_dir.'plugins.toml')

  call dein#end()
  call dein#save_state()
endif

" Auto install plugins
if dein#check_install()
  call dein#install()
endif

try
  colo nightfly
endtry

" Key mapping changes (remember <leader> was changed above)
exec 'silent source '.g:config_dir.'mappings.vim'
