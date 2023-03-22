local M = {}

-------------
-- aliases --
-------------
local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g

local packer_bootstrap = false

local function packer_init()
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = true
    cmd('!git clone --depth 1 https://github.com/wbthomason/packer.nvim '..install_path)
    cmd 'packadd packer.nvim'
  end
  cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'
end

packer_init()

function M.setup()
  local conf = {
    compile_path = fn.stdpath 'config'..'/lua/packer_compiled.lua',
    display = {
      open_fn = function ()
        return require('packer.util').float { border = 'rounded' }
      end
    }
  }

  local function plugins(use)
    -- Faster startup
    use { 'lewis6991/impatient.nvim' }

    -- packer manages itself
    use { 'wbthomason/packer.nvim', opt = true }

    -- session saving
    use { 'tpope/vim-obsession' }

    -- colorscheme
    use { 'folke/tokyonight.nvim' }

    -- fuzzy finding
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      },
      config = function()
        require'telescope'.setup {
          extensions = {
            fzf = {
              override_generic_sorter = true,
              override_file_sorter = true
            },
            media_files = {
              filetypes = {'png', 'webp', 'jpg', 'jpeg', 'pdf', 'webm', 'mp4'},
              find_cmd = 'rg'
            },
            file_browser = {
              initial_mode = 'normal'
            },
            ['ui-select'] = {
              require'telescope.themes'.get_dropdown()
            }
          }
        }
      end
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',   config = function() require'telescope'.load_extension('fzf') end, run = 'make' }
    use { 'nvim-telescope/telescope-github.nvim',       config = function() require'telescope'.load_extension('gh') end }
    use { 'nvim-telescope/telescope-media-files.nvim',  config = function() require'telescope'.load_extension('media_files') end }
    use { 'nvim-telescope/telescope-file-browser.nvim', config = function() require'telescope'.load_extension('file_browser') end }
    use { 'nvim-telescope/telescope-ui-select.nvim',     config = function() require'telescope'.load_extension('ui-select') end }

    use {
      'pwntester/octo.nvim', requires = {'nvim-telescope/telescope.nvim'},
      config = function() require'octo'.setup() end
    }

    -- diagnostics
    use {
      'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'trouble'.setup {} end
    }

    -- completion
    use {
      'ms-jpq/coq_nvim', branch = 'coq', -- main one
      setup = function()
        vim.g.coq_settings = {
          auto_start = 'shut-up'
        }
      end
    }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' } -- 9000+ Snippets
    use { 'ms-jpq/coq.thirdparty', branch = '3p' }

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
    use {
      'williamboman/nvim-lsp-installer', requires = 'neovim/nvim-lspconfig',
      config = function()
        local lsp_installer = require("nvim-lsp-installer")

        -- Register a handler that will be called for all installed servers.
        -- Alternatively, you may also register handlers on specific server instances instead (see example below).
        lsp_installer.on_server_ready(function(server)
            local opts = {}

            -- (optional) Customize the options passed to the server
            -- if server.name == "tsserver" then
            --     opts.root_dir = function() ... end
            -- end

            -- This setup() function is exactly the same as lspconfig's setup function.
            -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            server:setup(opts)
        end)
      end
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require'null-ls'.setup()
      end
    }

    -- enable treesitter
    use {
      'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = 'all',
          highlight = {
            enable = true,
            disable = {}
          },
          indentation = {
            enable = true
          }
        })
      end
    }

    -- keybinding help
    use {
      'folke/which-key.nvim',
      config = function() require'which-key'.setup {} end
    }

    use 'folke/lsp-colors.nvim'

    -- tpope plugins
    use {'tpope/vim-sensible'}
    use {'tpope/vim-sleuth'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {'tpope/vim-unimpaired'}

    use {'powerman/vim-plugin-AnsiEsc'}

    -- use {'itchyny/lightline.vim'}
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
        require('lualine').setup {
          options = {
            theme = 'auto'
          },
          extensions = { 'quickfix', 'fugitive' }
        }
      end
    }

    use {'kosayoda/nvim-lightbulb'}

    use {
      'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},
      config = function() require('gitsigns').setup() end
    }

    use { 'kchmck/vim-coffee-script' }

    use {'chrisbra/csv.vim'}

    use {'sirtaj/vim-openscad'}

    -- Haxe integration
    use { 'jdonaldson/vaxe', opt = true }

    -- Stabilize window moves
    -- use {
    --   'luukvbaal/stabilize.nvim',
    --   config = function() require('stabilize').setup() end
    -- }

    -- use {
    --   'gelguy/wilder.nvim', run=':UpdateRemotePlugins',
    --   config = function()
    --     vim.cmd [[
    --       call wilder#setup({'modes': [':', '/', '?']})
    --     ]]

    --     vim.cmd [[
    --       call wilder#set_option('pipeline', [
    --         \   wilder#branch(
    --         \     wilder#cmdline_pipeline(),
    --         \     wilder#search_pipeline(),
    --         \   ),
    --         \ ])
    --     ]]

    --     -- vim.cmd [[
    --     --   call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    --     --     \ 'highlights': {
    --     --     \   'border': 'Normal'
    --     --     \ },
    --     --     \ 'border': 'rounded',
    --     --     \ 'highlighter': wilder#basic_highlighter(),
    --     --     \ })))
    --     -- ]]
    --   end
    -- }

    use {
      'rcarriga/nvim-notify', event='VimEnter',
      config = function()
        vim.notify = require 'notify'
        require'notify'.setup({
          on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false })
          end
        })
      end
    }

    use { 'joanrivera/vim-highlight' }

    use { 'dstein64/vim-startuptime' }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          show_current_context = true,
          show_current_context_start = true,
          show_current_context_start_on_current_line = true
        }
      end
    }

    use { 'chrisbra/Colorizer' }

    -- Rendering for noice
    use { 'MunifTanjim/nui.nvim' }

    use {
      'folke/noice.nvim',
      event = 'VimEnter',
      config = function()
        require('noice').setup({
          popupmenu = { enabled = false },
          lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
              ['vim.lsp.util.stylize_markdown'] = true,
              ['cmp.entry.get_documentation'] = true
            }
          }
        })
        require('telescope').load_extension('noice')
      end,
      requires = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify'
      }
    }

    if packer_bootstrap then
      print 'Installing plugins. Restart required after installation!'
      require('packer').sync()
    end
  end

  pcall(require, 'impatient')
  pcall(require, 'packer_compiled')
  require('packer').init(conf)
  require('packer').startup(plugins)
end

return M
