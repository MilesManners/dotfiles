if exists('dein#_progname')
  " Color scheme
  if dein#tap('moonlight.vim')
    function! MyHighlights()
      hi CocFloating      guibg=#1B1B1B
      hi CocHighlightText guibg=#111111 gui=bold
    endfunction

    augroup MyColors
      autocmd!
      au ColorScheme moonlight call MyHighlights()
    augroup end

    colo moonlight
  endif

  " Lightline config
  if dein#tap('lightline.vim')
    let g:lightline = {
          \  'colorscheme': 'one',
          \  'active': {
          \    'left': [['mode', 'paste'], ['git', 'diagnostic', 'filename', 'method', 'modified']],
          \    'right': [['filetype', 'fileencoding', 'lineinfo', 'percent'], ['blame']]
          \  },
          \  'inactive': {
          \    'left': [['filename', 'modified']],
          \    'right': [['lineinfo'], ['percent']]
          \  },
          \  'component_function': {
          \    'blame': 'LightlineGitBlame'
          \  },
          \}

    function! LightlineGitBlame() abort
      let blame = get(b:, 'coc_git_blame', '')
      " return blame
      return winwidth(0) > 120 ? blame : ''
    endfunction
  endif

  " Enable rainbow brackets
  let g:rainbow_active=1

  " Prevent EditorConfig from clashing with Fugitive
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  " CoC
  let g:coc_global_extensions=[
        \  'coc-actions',
        \  'coc-css',
        \  'coc-eslint',
        \  'coc-explorer',
        \  'coc-git',
        \  'coc-highlight',
        \  'coc-html',
        \  'coc-import-cost',
        \  'coc-json',
        \  'coc-lists',
        \  'coc-marketplace',
        \  'coc-pairs',
        \  'coc-sh',
        \  'coc-tsserver',
        \  'coc-vetur',
        \  'coc-vimlsp',
        \  'coc-yaml',
        \  'coc-yank'
        \]

  if dein#tap('coc.nvim')
    set signcolumn=yes

    augroup mygroup
      autocmd!

      " Highlight occurences of word under cursor
      autocmd CursorHold * silent call CocActionAsync('highlight')

      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

      " Update signature help on jump placeholder
      autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Make yank highlight a flash
    highlight HighlightedyankRegion guibg=#FFFF00 guifg=#000000
    let g:highlightedyank_highlight_duration=200

    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

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
  endif
endif
