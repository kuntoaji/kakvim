-- kakvim: Neovim configuration for Ruby (on Rails) development
-- https://github.com/kuntoaji/kakvim

if vim.fn.has('nvim-0.12') == 0 then
  vim.api.nvim_echo({ { 'kakvim requires Neovim 0.12 or newer', 'ErrorMsg' } }, true, {})
  return
end

-- Set the Leader before any plugin or mapping reads it
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

require('kakvim.options')
require('kakvim.autocmds')
require('kakvim.plugins')
require('kakvim.lsp')
require('kakvim.keymaps')
