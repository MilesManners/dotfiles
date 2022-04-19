-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/miles/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/miles/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/miles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/miles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/miles/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Colorizer = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/Colorizer",
    url = "https://github.com/chrisbra/Colorizer"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/completion-treesitter",
    url = "https://github.com/nvim-treesitter/completion-treesitter"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n£\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2/show_current_context_start_on_current_line\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\rfugitive\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nh\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\16/bin/Debug/\vgetcwd\16Path to dll\ninput\afn\bvimœ\2\1\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0003\4\n\0=\4\v\3>\3\1\2=\2\b\1K\0\1\0\fprogram\0\1\0\3\tname\24launch - netcoredbg\ttype\15netcoredbg\frequest\vlaunch\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\ttype\15executable\fcommand*/path/to/dotnet/netcoredbg/netcoredbg\15netcoredbg\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n%\0\1\6\0\1\0\0064\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetupO\1\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nM\0\1\5\0\4\0\a6\1\0\0009\1\1\0019\1\2\1\18\3\0\0005\4\3\0B\1\3\1K\0\1\0\1\0\1\14focusable\1\24nvim_win_set_config\bapi\bvimd\1\0\4\0\a\0\0146\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\fon_open\1\0\0\0\nsetup\frequire\vnotify\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/miles/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n­\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\16indentation\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/miles/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n–\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\15extensions\1\0\0\17file_browser\1\0\1\17initial_mode\vnormal\16media_files\14filetypes\1\0\1\rfind_cmd\arg\1\b\0\0\bpng\twebp\bjpg\tjpeg\bpdf\twebm\bmp4\bfzf\1\0\0\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  vaxe = {
    loaded = false,
    needs_bufread = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/opt/vaxe",
    url = "https://github.com/jdonaldson/vaxe"
  },
  ["vim-coffee-script"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-coffee-script",
    url = "https://github.com/kchmck/vim-coffee-script"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-highlight"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-highlight",
    url = "https://github.com/joanrivera/vim-highlight"
  },
  ["vim-openscad"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-openscad",
    url = "https://github.com/sirtaj/vim-openscad"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc",
    url = "https://github.com/powerman/vim-plugin-AnsiEsc"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\rfugitive\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n–\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\15extensions\1\0\0\17file_browser\1\0\1\17initial_mode\vnormal\16media_files\14filetypes\1\0\1\rfind_cmd\arg\1\b\0\0\bpng\twebp\bjpg\tjpeg\bpdf\twebm\bmp4\bfzf\1\0\0\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n­\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\16indentation\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope-media-files.nvim
time([[Config for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0", "config", "telescope-media-files.nvim")
time([[Config for telescope-media-files.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n%\0\1\6\0\1\0\0064\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetupO\1\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n£\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2/show_current_context_start_on_current_line\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope-github.nvim
time([[Config for telescope-github.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0", "config", "telescope-github.nvim")
time([[Config for telescope-github.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nh\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\16/bin/Debug/\vgetcwd\16Path to dll\ninput\afn\bvimœ\2\1\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0003\4\n\0=\4\v\3>\3\1\2=\2\b\1K\0\1\0\fprogram\0\1\0\3\tname\24launch - netcoredbg\ttype\15netcoredbg\frequest\vlaunch\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\ttype\15executable\fcommand*/path/to/dotnet/netcoredbg/netcoredbg\15netcoredbg\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-notify'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
