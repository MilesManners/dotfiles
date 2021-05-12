" Reload neovim config
nnoremap <silent><expr> <leader>so ':so '.g:config_dir.'init.vim<CR>'

" Escape from terminal
tnoremap <Esc> <C-\><C-n>

" Window mappings <leader> w

" Window movement
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ww <C-w>w
nnoremap <leader>wp <C-w>p

nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>wW <C-w>W

" Window splits
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

" Window close
nnoremap <leader>wq <C-w>q
nnoremap <leader>wc <C-w>c

nnoremap <leader>wo <C-w>o
nnoremap <leader>wT <c-w>T

" Buffer mappings <leader> b
aug vimrc_mappings
  au!
  au VimEnter * 
     \  if exists(":CocList")
     \|   nnoremap <silent> <leader>bb :<C-u>CocList buffers<CR>
     \| else
     \|   nnoremap <silent> <leader>bb :<C-u>buffers<CR>
     \| endif
aug END

function! s:visual_center() range
  execute a:firstline + (a:lastline - a:firstline) / 2
endfunction

xnoremap zz :call <SID>visual_center()<CR>zzgv

nmap s <Plug>(easymotion-prefix)

nnoremap Y y$
nnoremap C c$

" CoC
if exists('g:vscode')
  " rename the current word in the cursor
  nmap <silent> <leader>rn :<C-u>call VSCodeNotify('editor.action.rename')<CR>

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g :<C-u>call VSCodeNotify('editor.action.marker.prev')<CR>
  nmap <silent> ]g :<C-u>call VSCodeNotify('editor.action.marker.next')<CR>

  " GoTo code navigation.
  nmap <silent> gy :<C-u>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
  nmap <silent> gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>
  nmap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>

  " Apply AutoFix to problem on the current line.
  nmap <silent> <leader>qf :<C-u>call VSCodeNotify('editor.action.quickFix')<CR>

  " Use K to show documentation in preview window
  nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
else
  xnoremap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

  " rename the current word in the cursor
  nmap <silent> <leader>rn <Plug>(coc-rename)

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Apply AutoFix to problem on the current line.
  nmap <silent> <leader>qf <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap <silent> if <Plug>(coc-funcobj-i)
  xmap <silent> af <Plug>(coc-funcobj-a)
  omap <silent> if <Plug>(coc-funcobj-i)
  omap <silent> af <Plug>(coc-funcobj-a)
  xmap <silent> ic <Plug>(coc-classobj-i)
  omap <silent> ic <Plug>(coc-classobj-i)
  xmap <silent> ac <Plug>(coc-classobj-a)
  omap <silent> ac <Plug>(coc-classobj-a)

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
  " Grep in CWD
  nnoremap <silent> <leader>c/ :<C-u>CocList grep<CR>
  " Buffers
  nnoremap <silent> <leader>cb :<C-u>CocList buffers<CR>

  " format code
  nmap <silent> <leader>cf <Plug>(coc-format-selected)<CR>
  vmap <silent> <leader>cf <Plug>(coc-format-selected)<CR>

  " run code actions
  xmap <silent> <leader>ca <Plug>(coc-codeaction-selected)<CR>
  nmap <silent> <leader>ca <Plug>(coc-codeaction-selected)<CR>

  nnoremap <silent> <leader>e :CocCommand explorer --position=floating<CR>

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)


  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  " coc-pairs newline fix in both options
  if exists('*complete_info')
    inoremap <silent><expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  else
    inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>
endif
