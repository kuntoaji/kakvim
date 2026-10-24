-- Check that docs/keymaps.md and nvim/lua/kakvim/keymaps.lua agree.
-- Run from the repository root: nvim --headless -l scripts/check-keymaps.lua
--
-- Fails when:
--   * a mapping in keymaps.lua has no `desc`
--   * a mapping in keymaps.lua has no "kakvim" row in docs/keymaps.md
--   * a "kakvim" row in docs/keymaps.md has no mapping in keymaps.lua

vim.g.mapleader = '\\'
vim.opt.runtimepath:prepend('nvim')

-- Record every mapping that keymaps.lua defines, without plugins loaded
local defined = {}
local errors = {}
local set = vim.keymap.set
vim.keymap.set = function(modes, lhs, rhs, opts)
  for _, mode in ipairs(type(modes) == 'table' and modes or { modes }) do
    local key = mode .. ' ' .. lhs:gsub('^<leader>', '\\')
    defined[key] = true
    if not (opts and opts.desc) then
      table.insert(errors, 'missing desc: ' .. key)
    end
  end
  return set(modes, lhs, rhs, opts)
end
require('kakvim.keymaps')

-- Collect the "kakvim" rows from the guide: | `keys` | mode | action | kakvim |
local documented = {}
for line in io.lines('docs/keymaps.md') do
  local keys, mode = line:match('^| `([^`]+)` | (%a) | .* | kakvim |$')
  if keys then
    documented[mode .. ' ' .. keys] = true
  end
end

for key in pairs(defined) do
  if not documented[key] then
    table.insert(errors, 'not in docs/keymaps.md: ' .. key)
  end
end
for key in pairs(documented) do
  if not defined[key] then
    table.insert(errors, 'documented but not mapped: ' .. key)
  end
end

if #errors > 0 then
  table.sort(errors)
  io.stderr:write(table.concat(errors, '\n') .. '\n')
  os.exit(1)
end
print(('OK: %d mappings match docs/keymaps.md'):format(vim.tbl_count(defined)))
