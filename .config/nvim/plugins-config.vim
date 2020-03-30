if exists('dein#_progname')
  " Color scheme
  if dein#tap('moonlight.vim')
    colo moonlight
  endif

  " Lightline config
  if dein#tap('lightline.vim')
    let g:lightline = {
          \  'colorscheme': 'one',
          \  'active': {
          \    'left': [['mode', 'paste'], ['git', 'diagnostic', 'cocstatus', 'filename', 'method', 'modified']],
          \    'right': [['filetype', 'fileencoding', 'lineinfo', 'percent'], ['blame']]
          \  },
          \  'inactive': {
          \    'left': [['filename', 'modified']],
          \    'right': [['lineinfo'], ['percent']]
          \  },
          \  'component_function': {
          \    'blame': 'LightlineGitBlame',
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
        \  'coc-git',
        \  'coc-highlight',
        \  'coc-html',
        \  'coc-import-cost',
        \  'coc-json',
        \  'coc-lists',
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

    " Highlight occurences of word under cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Make yank highlight a flash
    highlight HighlightedyankRegion guibg=#FFFF00 guifg=#000000
    let g:highlightedyank_highlight_duration=200

    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction

    xnoremap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " rename the current word in the cursor
    nnoremap <silent> <leader>rn <Plug>(coc-rename)

    inoremap <silent><expr> <TAB>   pumvisible() ? "\<C-n>" : coc#refresh()
    inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " GoTo code navigation.
    nnoremap <silent> gd <Plug>(coc-definition)
    nnoremap <silent> gy <Plug>(coc-type-definition)
    nnoremap <silent> gi <Plug>(coc-implementation)
    nnoremap <silent> gr <Plug>(coc-references)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xnoremap if <Plug>(coc-funcobj-i)
    xnoremap af <Plug>(coc-funcobj-a)
    onoremap if <Plug>(coc-funcobj-i)
    onoremap af <Plug>(coc-funcobj-a)

    " Use `[g` and `]g` to navigate diagnostics
    nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
    nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <leader>cx :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <leader>co :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<cr>
    " Resume latest coc list.
    nnoremap <silent> <leader>cr :<C-u>CocListResume<CR>
    " Restart CoC
    nnoremap <silent> <leader>cR :<C-u>CocRestart<CR>
    " List errors
    nnoremap <silent> <leader>cl :<C-u>CocList locationlist<cr>

    " format code
    nnoremap <leader>cf  <Plug>(coc-format-selected)
    vnoremap <leader>cf  <Plug>(coc-format-selected)

    " run code actions
    vnoremap <leader>ca  <Plug>(coc-codeaction-selected)
    nnoremap <leader>ca  <Plug>(coc-codeaction-selected)
  endif
endif
