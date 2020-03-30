" Open netrw
nnoremap <silent> <leader>e :Ex<CR>
" Reload neovim config
nnoremap <silent><expr> <leader>so ':so '.g:config_dir.'init.vim<CR>'

" Escape from terminal
tnoremap <Esc> <C-\><C-n>

" Window movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-w> <C-w>w
nnoremap <A-p> <C-w>p

tnoremap <A-h> <Esc><C-w>h
tnoremap <A-j> <Esc><C-w>j
tnoremap <A-k> <Esc><C-w>k
tnoremap <A-l> <Esc><C-w>l
tnoremap <A-w> <Esc><C-w>w
tnoremap <A-p> <Esc><C-w>p

" Window resize
nnoremap <A-=> <C-w>=

tnoremap <A-=> <Esc><C-w>=

" Window splits
nnoremap <A-s> <C-w>s
nnoremap <A-v> <C-w>v

tnoremap <A-s> <Esc><C-w>s
tnoremap <A-v> <Esc><C-w>v

" Window close
nnoremap <A-c> <C-w>c

tnoremap <A-c> <C-w>c
