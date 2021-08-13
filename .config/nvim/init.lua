local utils = require 'utils'

-------------
-- aliases --
-------------
local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g
-- options
local o   = vim.o  -- global
local wo  = vim.wo -- window
local bo  = vim.bo -- buffer

-- early settings
g.mapleader = ' '
o.termguicolors = true

-- auto install package manager
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- load the package manager
cmd 'packadd packer.nvim'

-- auto compile when there are changes in plugins.lua
utils.create_augroup('reload_plugins', {
  {'BufWritePost', 'plugins.lua', 'PackerCompile'}
})

-- plugins
require 'plugins'

local lsp = require 'lspconfig'
lsp.tsserver.setup {}
-- lsp['coffeescript-lsp-core'].setup {}

-- settings
cmd 'colorscheme nightfly'

require 'settings'

-- mappings
require 'maps'
