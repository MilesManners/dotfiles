" Open netrw
nmap <silent> <leader>e :Ex<CR>
" Reload neovim config
nmap <silent><expr> <leader>so ':so '.g:config_dir.'init.vim<CR>'

" Escape from terminal
tmap <Esc> <C-\><C-n>

" Window movement
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l
nmap <A-w> <C-w>w
nmap <A-p> <C-w>p

tmap <A-h> <Esc><C-w>h
tmap <A-j> <Esc><C-w>j
tmap <A-k> <Esc><C-w>k
tmap <A-l> <Esc><C-w>l
tmap <A-w> <Esc><C-w>w
tmap <A-p> <Esc><C-w>p

" Window resize
nmap <A-=> <C-w>=

tmap <A-=> <Esc><C-w>=

" Window splits
nmap <A-s> <C-w>s
nmap <A-v> <C-w>v

tmap <A-s> <Esc><C-w>s
tmap <A-v> <Esc><C-w>v

" Window close
nmap <A-c> <C-w>c

tmap <A-c> <C-w>c
