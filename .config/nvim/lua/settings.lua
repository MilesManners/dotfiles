local utils = require 'utils'

local g = vim.g
local o = vim.o
local wo = vim.wo

-- enable buffers to be hidden without closing them
o.hidden     = true

-- preview substitution
o.incsearch  = true
o.inccommand = 'nosplit'

-- ignore case in search without capital letters
o.ignorecase = true
o.smartcase  = true

-- hide mode in statusline
o.showmode   = false

-- more intuitive split direction
o.splitbelow = true
o.splitright = true

-- show some hidden characters
wo.list      = true

-- Better completion experience
o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra message during completion
o.shortmess = o.shortmess .. 'c'

-- lightline
g.lightline = {colorscheme = 'nightfly'}

-- completion
g.completion_enable_auto_popup = 0
g.completion_enable_snippet = 'vim-vsnip'

utils.create_augroup('nvim_yank', {
  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank()'}
})

-- Neovide
g.neovide_cursor_vfx_mode = 'pixiedust'

utils.create_augroup('syntax_associations', {
  {'BufRead,BufNewFile', '*.handlebars,*.hbs', 'set ft=html.handlebars'},
  {'BufRead,BufNewFile', '.gitconfig.*', 'set ft=gitconfig'}
})
