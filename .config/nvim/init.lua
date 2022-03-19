-- early settings
vim.g.mapleader = ' '
vim.o.termguicolors = true

-- settings
require 'settings'

-- plugins
require('plugins').setup()

vim.cmd 'colorscheme tokyonight'

-- mappings
require 'maps'
