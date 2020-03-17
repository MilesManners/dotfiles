" Change <leader> to <Space>
let mapleader="\<Space>"

" Open netrw
nnoremap <silent> <leader>e  :Ex<CR>
" Reload vim config
nnoremap <silent> <leader>so :so ~/.vimrc<CR>

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
