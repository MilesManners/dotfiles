local cmd = vim.cmd

local M = {}

function M.create_augroup(name, autocmds)
  cmd('augroup ' .. name)
  cmd 'autocmd!'
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd 'augroup end'
end

-- function M.map(mode, lhs, rhs, opts)
--   local options = {noremap = true}
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

function M.map(map_table, opts)
  -- local options = {noremap = true}
  -- if opts then options = vim.tbl_extend('force', options, opts) end

  for mode, maps in pairs(map_table) do
    for _, m in ipairs(maps) do
      vim.api.nvim_set_keymap(mode, m[1], m[2], opts)
    end
  end
end

return M
