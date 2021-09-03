local utils = require 'utils'

local g = vim.g

return require('packer').startup(function()
  -- packer manages itself
  use {'wbthomason/packer.nvim', opt = true}

  -- colorscheme
  use {'bluz71/vim-nightfly-guicolors'}

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      require'telescope'.setup {
        extensions = {
          fzf = {
            override_generic_sorter = true,
            override_file_sorter = true
          }
        }
      }
    end
  }

  -- use {
  --   'nvim-telescope/telescope-packer.nvim', requires = {'nvim-telescope/telescope.nvim'},
  --   config = function() require('telescope').load_extension('telescope-packer') end
  -- }

  use {
    'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
    config = function() require'telescope'.load_extension('fzf') end
  }

  use {
    'nvim-telescope/telescope-github.nvim', requires = {'nvim-telescope/telescope.nvim'},
    config = function() require'telescope'.load_extension('gh') end
  }

  -- diagnostics
  use {
    'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'trouble'.setup {} end
  }

  -- completion
  use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets

  -- use {
  --   'nvim-lua/completion-nvim',
  --   requires = {{'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'}},
  --   config = function()
  --     vim.cmd 'autocmd BufEnter * lua require\'completion\'.on_attach()'
  --   end
  -- }

  use 'nvim-treesitter/completion-treesitter'

  -- DAP
  use {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require'dap'

      dap.adapters.netcoredbg = {
        type = 'executable',
        command = '/path/to/dotnet/netcoredbg/netcoredbg',
        args = {'--interpreter=vscode'}
      }

      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
              return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end
        }
      }
    end
  }

  -- easier LSP config
  use {'neovim/nvim-lspconfig'}

  local nvim_lsp = require'lspconfig'

  nvim_lsp.tsserver.setup{}
  nvim_lsp.bashls.setup{}
  -- require('lspconfig').pyls.setup{}
  -- require('lspconfig').pyright.setup{}

  -- use {
  --   'tjdevries/nlua.nvim', requires = {'nvim-lspconfig'},
  --   config = function()
  --     require('nlua.lsp.nvim').setup(require('lspconfig'), {
  --       on_attach = function(client, bufnr)
  --         require('completion').on_attach()

  --         vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --       end
  --     })
  --   end
  -- }

  -- enable treesitter
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'maintained',
        highlight = {
          enable = true,
          disable = {}
        }
      })
    end
  }

  -- keybinding help
  use {
    'folke/which-key.nvim',
    config = function()
      require'which-key'.setup {}
    end
  }

  use 'folke/lsp-colors.nvim'

  -- tpope plugins
  use {'tpope/vim-sensible'}
  use {'tpope/vim-sleuth'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-fugitive'}

  use {'powerman/vim-plugin-AnsiEsc'}

  use {'itchyny/lightline.vim'}

  use {'lukas-reineke/indent-blankline.nvim'}

  use {'kosayoda/nvim-lightbulb'}

  use {
    'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }

  use {'kchmck/vim-coffee-script'}

  use {'chrisbra/csv.vim'}

  use {'sirtaj/vim-openscad'}

  -- Haxe integration
  use {'jdonaldson/vaxe'}
end)
