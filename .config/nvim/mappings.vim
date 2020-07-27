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

tmap <A-h> <Esc><C-w>h
tmap <A-j> <Esc><C-w>j
tmap <A-k> <Esc><C-w>k
tmap <A-l> <Esc><C-w>l
tmap <A-w> <Esc><C-w>w
tmap <A-p> <Esc><C-w>p

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

" CoC
xnoremap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" rename the current word in the cursor
nmap <silent> <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>   pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap <silent> if <Plug>(coc-funcobj-i)
xmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> if <Plug>(coc-funcobj-i)
omap <silent> af <Plug>(coc-funcobj-a)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent> <leader>cx :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent> <leader>cc :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent> <leader>co :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<CR>
" Resume latest coc list.
nnoremap <silent> <leader>cr :<C-u>CocListResume<CR>
" Restart CoC
nnoremap <silent> <leader>cR :<C-u>CocRestart<CR>
" List errors
nnoremap <silent> <leader>cl :<C-u>CocList locationlist<CR>

" format code
nmap <silent> <leader>cf <Plug>(coc-format-selected)<CR>
vmap <silent> <leader>cf <Plug>(coc-format-selected)<CR>

" run code actions
vmap <silent> <leader>ca <Plug>(coc-codeaction-selected)<CR>
nmap <silent> <leader>ca <Plug>(coc-codeaction-selected)<CR>

nnoremap <silent> <leader>e :CocCommand explorer --position=floating<CR>

" coc-pairs newline fix
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
