local utils = require 'utils'

utils.map({
  ["t"]={{'<Esc>', '<C-\\><C-n>'}},

  ["n"]={
    {'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>'},
    {'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'gr',         '<cmd>lua vim.lsp.buf.references()<CR>'},
    {'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'ge',         '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'},
    {'K',          '<cmd>lua vim.lsp.buf.hover()<CR>'},
    {'<leader>f',  '<cmd>lua vim.lsp.buf.formatting()<CR>'},
    {'<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
    {'<leader>a',  '<cmd>lua vim.lsp.buf.code_action()<CR>'},

    {'<leader>xx', '<cmd>TroubleToggle<cr>'},

    {'<leader>hl', ':Highlight h<CR>'},
    {'<leader>h/', ':Highlight s<CR>'},
    {'<leader>hi', ':Highlight a<CR>'},
    {'<leader>hu', ':Highlight r<CR>'},
    {'<leader>hn', ':Highlight n<CR>'},

    {'<leader>oi', ':Octo issue list assignee=MilesManners states=OPEN<CR>'},
    {'<leader>op', ':Octo pr list'},
  },

  ["i"]={
    {'<expr> <Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"'},
    {'<expr> <S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'}
  },

  ["x"]={
    {'<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>'}
  }
}, {noremap = true})

utils.map({
  ["i"]={
    {'<tab>', '<Plug>(completion_smart_tab)'},
    {'<s-tab>', '<Plug>(completion_smart_s_tab)'}
  }
}, {})

local wk = require'which-key'

wk.register({
  w = {
    name = 'window',

    h     = { '<C-w>h', 'Go left'},
    j     = { '<C-w>j', 'Go down'},
    k     = { '<C-w>k', 'Go up'},
    l     = { '<C-w>l', 'Go right'},

    H     = { '<C-w>H', 'Move left'},
    J     = { '<C-w>J', 'Move down'},
    K     = { '<C-w>K', 'Move up'},
    L     = { '<C-w>L', 'Move right'},

    s     = { '<C-w>s', 'Split horizontal'},
    v     = { '<C-w>v', 'Split vertical'},

    c     = { '<C-w>c', 'Close window'},
    q     = { '<C-w>q', 'Kill window'},

    T     = { '<C-w>T', 'Move to new tab'},

    ['='] = { '<C-w>=', 'Resize panels'},
  },
  f = {
    name = 'file',
    f     = { '<cmd>lua require("telescope.builtin").find_files({hidden=true,no_ignore=true})<cr>', 'Find file' },
    F     = { '<cmd>lua require("telescope").extensions.file_browser.file_browser()<cr>', 'Browse files' },
    ['/'] = { '<cmd>lua require("telescope.builtin").live_grep()<cr>',                    'Find in files' },
    b     = { '<cmd>lua require("telescope.builtin").buffers()<cr>',                      'Find buffer' },
    r     = { '<cmd>lua require("telescope.builtin").oldfiles()<cr>',                     'Find recent' },
    h     = { '<cmd>lua require("telescope.builtin").help_tags()<cr>',                    'Find help' },
  }
}, {
  mode = 'n',
  prefix = '<leader>'
})

wk.register({ ['<Esc>'] = '<C-\\><C-n>' }, { mode = 't' })
