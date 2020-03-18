" Open netrw
nnoremap <silent> <leader>e  :Ex<CR>
" Reload neovim config
nnoremap <silent><expr> <leader>so ':so '.g:config_dir.'init.vim<CR>'

" Escape from terminal
tnoremap <silent> <Esc> <C-\><C-n>

" Window movement
nnoremap <silent> <A-h> :winc h<CR>
nnoremap <silent> <A-j> :winc j<CR>
nnoremap <silent> <A-k> :winc k<CR>
nnoremap <silent> <A-l> :winc l<CR>
nnoremap <silent> <A-w> :winc w<CR>
nnoremap <silent> <A-p> :winc p<CR>

" Window resize
nnoremap <silent> <A-_> :winc _<CR>

" Window splits
nnoremap <silent> <A-s> :winc s<CR>
nnoremap <silent> <A-v> :winc v<CR>

" Window close
nnoremap <silent> <A-c> :winc c<CR>
