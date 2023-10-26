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
      'williamboman/mason.nvim',
      requires = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'jayp0521/mason-nvim-dap.nvim',
        'jay-babu/mason-null-ls.nvim',
        { 'ms-jpq/coq_nvim', branch = 'coq' }
      },
      config = function()
        require'mason'.setup()
        require'mason-lspconfig'.setup()
        require'mason-nvim-dap'.setup { automatic_setup = true }
        require'mason-null-ls'.setup { automatic_setup = true }

        local lsp = require 'lspconfig'
        local coq = require 'coq'

        require'mason-lspconfig'.setup_handlers {
          function (server_name)
            lsp[server_name].setup(coq.lsp_ensure_capabilities())
          end,

          lua_ls = function ()
            lsp.lua_ls.setup(coq.lsp_ensure_capabilities {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }
                  }
                }
              }
            })
          end
        }
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
    -- use {'tpope/vim-unimpaired'}

    use {
      'tummetott/unimpaired.nvim',
      config = function() require'unimpaired'.setup() end
    }

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

    use {
      'kosayoda/nvim-lightbulb',
      config = function() require'nvim-lightbulb'.setup {autocmd = {enabled = true}} end
    }

    use {
      'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},
      config = function()
        require'gitsigns'.setup {
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local wk = require('which-key')

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']h', function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, {expr=true, desc='next hunk'})

            map('n', '[h', function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, {expr=true, desc='prev hunk'})

            -- Actions
            map({'n', 'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>', {desc='stage hunk'})
            map({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>', {desc='reset hunk'})
            map('n', '<leader>gS', gs.stage_buffer, {desc='stage buffer'})
            map('n', '<leader>gu', gs.undo_stage_hunk, {desc='undo stage hunk'})
            map('n', '<leader>gR', gs.reset_buffer, {desc='reset buffer'})
            map('n', '<leader>gp', gs.preview_hunk, {desc='preview hunk'})
            map('n', '<leader>gb', function() gs.blame_line{full=true} end, {desc='blame line'})
            map('n', '<leader>tb', gs.toggle_current_line_blame, {desc='toggle current line blame'})
            map('n', '<leader>gd', gs.diffthis, {desc='diff this'})
            map('n', '<leader>gD', function() gs.diffthis('~') end, {desc='diff file'})
            map('n', '<leader>td', gs.toggle_deleted, {desc='toggle deleted'})

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc='select hunk'})
          end
        }
      end
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
        require('ibl').setup()
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

    use { 'voldikss/vim-floaterm' }

    -- Lua
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { "Normal", "#ffffff" },
            term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 5, -- amount of lines we will try to show around the current line
          treesitter = true, -- use treesitter when available for the filetype
          -- treesitter is used to automatically expand the visible text,
          -- but you can further control the types of nodes that should always be fully expanded
          expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
            "function",
            "method",
            "method_definition",
            "table",
            "if_statement",
          },
          exclude = {}, -- exclude these filetypes
        }
      end
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
