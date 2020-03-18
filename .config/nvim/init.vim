" Vim configuration

if &compatible
  set nocompatible
endif

" Change <leader> to <Space>
let mapleader="\<Space>"

function EnsureDirectory(dir)
  if (!isdirectory(expand(a:dir)))
    call mkdir(a:dir, 'p')
  endif
  return a:dir
endfunction

" Directory of config files
" Use XDG_CONFIG_HOME if possible, otherwise default to HOME/.config
if empty($XDG_CONFIG_HOME)
  let g:config_dir=EnsureDirectory($HOME.'/.config/nvim/')
else
  let g:config_dir=EnsureDirectory($XDG_CONFIG_HOME.'/nvim/')
endif

" Directory of plugins
let g:plugin_dir=EnsureDirectory($HOME.'/.cache/dein')

exec 'silent source '.g:config_dir.'base.vim'
exec 'silent source '.g:config_dir.'dein.vim'
exec 'silent source '.g:config_dir.'plugins-config.vim'
exec 'silent source '.g:config_dir.'mappings.vim'
