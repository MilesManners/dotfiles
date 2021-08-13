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
  local success, result = pcall(loadstring(s))
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
  ["completion-nvim"] = {
    config = { "\27LJ\2\nZ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0;autocmd BufEnter * lua require'completion'.on_attach()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nh\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\16/bin/Debug/\vgetcwd\16Path to dll\ninput\afn\bvimœ\2\1\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0003\4\n\0=\4\v\3>\3\1\2=\2\b\1K\0\1\0\fprogram\0\1\0\3\frequest\vlaunch\tname\24launch - netcoredbg\ttype\15netcoredbg\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand*/path/to/dotnet/netcoredbg/netcoredbg\ttype\15executable\15netcoredbg\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n•\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\2B\0\2\1K\0\1\0\14highlight\fdisable\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/miles/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n’\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15extensions\1\0\0\bfzf\1\0\0\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  vaxe = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vaxe"
  },
  ["vim-coffee-script"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-coffee-script"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-openscad"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-openscad"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/miles/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: completion-nvim
time([[Config for completion-nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0;autocmd BufEnter * lua require'completion'.on_attach()\bcmd\bvim\0", "config", "completion-nvim")
time([[Config for completion-nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nh\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\16/bin/Debug/\vgetcwd\16Path to dll\ninput\afn\bvimœ\2\1\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0003\4\n\0=\4\v\3>\3\1\2=\2\b\1K\0\1\0\fprogram\0\1\0\3\frequest\vlaunch\tname\24launch - netcoredbg\ttype\15netcoredbg\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand*/path/to/dotnet/netcoredbg/netcoredbg\ttype\15executable\15netcoredbg\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n’\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15extensions\1\0\0\bfzf\1\0\0\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope-github.nvim
time([[Config for telescope-github.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0", "config", "telescope-github.nvim")
time([[Config for telescope-github.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n•\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\2B\0\2\1K\0\1\0\14highlight\fdisable\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
