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

-- More normal mouse behavior
g.mouse      = 'a'

-- Better completion experience
o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra message during completion
o.shortmess = o.shortmess .. 'c'

-- Don't show diagnostic sign column
vim.diagnostic.config({
  signs = false
})

-- Theme
g.tokyonight_hide_inactive_statusline = false
g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer', 'help', 'fugitive', 'gitcommit', 'trouble' }

-- COQ
g.coq_settings = { auto_start = 'shut-up' }

utils.create_augroup('nvim_yank', {
  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank()'}
})

-- Neovide
g.neovide_cursor_vfx_mode = 'pixiedust'

utils.create_augroup('syntax_associations', {
  {'BufRead,BufNewFile', '*.handlebars,*.hbs', 'set ft=html.handlebars'},
  {'BufRead,BufNewFile', '.gitconfig.*', 'set ft=gitconfig'}
})

-- vim-highlight
g.lcolor_bg = "#4B0082,#0a4c4b,#671a52,#4c141a,#093c26,#000f40,#4f004f,#293652"

-- coffeescript
g.coffee_compiler = 'npx coffee'
