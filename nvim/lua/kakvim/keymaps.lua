-- All custom mappings live here. Every mapping needs a `desc`:
-- which-key shows it, and docs/keymaps.md must list it.
-- Built-in LSP keys (K, grn, gra, grr, gri, gO, [d, ]d) are Neovim defaults.

local map = vim.keymap.set

-- Files and search
map('n', '<leader>g', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
map('n', '<leader>t', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', { desc = 'Find open buffers' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Grep in project' })
map('n', '<leader>fw', '<cmd>Telescope grep_string<cr>', { desc = 'Grep word under cursor' })
map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent files' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Search help' })
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Search keymaps' })

-- Switch between panes
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left pane' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower pane' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper pane' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right pane' })

-- Git
map('n', '<leader>Gs', '<cmd>Git<cr>', { desc = 'Git status (fugitive)' })
map('n', '<leader>Gb', '<cmd>Git blame<cr>', { desc = 'Git blame' })
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview hunk' })
map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Reset hunk' })
map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage hunk' })
map('n', ']h', '<cmd>Gitsigns nav_hunk next<cr>', { desc = 'Next hunk' })
map('n', '[h', '<cmd>Gitsigns nav_hunk prev<cr>', { desc = 'Previous hunk' })

-- Rails (vim-rails)
map('n', '<leader>ra', '<cmd>A<cr>', { desc = 'Alternate file (e.g. model <-> spec)' })
map('n', '<leader>rr', '<cmd>R<cr>', { desc = 'Related file (e.g. controller <-> view)' })

-- Diagnostics
map('n', '<leader>x', vim.diagnostic.setloclist, { desc = 'List diagnostics' })

-- Clear search highlight (Ctrl-l did this by default before it moved panes)
map('n', '<Esc>', '<cmd>nohlsearch<cr><Esc>', { desc = 'Clear search highlight' })

-- Tab and Shift-Tab move through the completion menu
map('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true, desc = 'Next completion item' })
map('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true, desc = 'Previous completion item' })
