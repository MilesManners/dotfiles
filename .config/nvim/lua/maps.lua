local utils = require 'utils'

utils.map({
  ["t"]={{'<Esc>', '<C-\\><C-n>'}},

  ["n"]={
    {'<leader>wh', '<C-w>h'},
    {'<leader>wj', '<C-w>j'},
    {'<leader>wk', '<C-w>k'},
    {'<leader>wl', '<C-w>l'},

    {'<leader>wH', '<C-w>H'},
    {'<leader>wJ', '<C-w>J'},
    {'<leader>wK', '<C-w>K'},
    {'<leader>wL', '<C-w>L'},

    {'<leader>ws', '<C-w>s'},
    {'<leader>wv', '<C-w>v'},

    {'<leader>wc', '<C-w>c'},
    {'<leader>wq', '<C-w>q'},

    {'<leader>wT', '<C-w>T'},

    {'<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>'},
    {'<leader>f/', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>'},
    {'<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>'},

    {'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>'},
    {'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'gr',         '<cmd>lua vim.lsp.buf.references()<CR>'},
    {'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'ge',         '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'},
    {'K',          '<cmd>lua vim.lsp.buf.hover()<CR>'},
    {'<leader>f',  '<cmd>lua vim.lsp.buf.formatting()<CR>'},
    {'<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
    {'<leader>a',  '<cmd>lua vim.lsp.buf.code_action()<CR>'},

    {'<leader>xx', '<cmd>TroubleToggle<cr>'}
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
