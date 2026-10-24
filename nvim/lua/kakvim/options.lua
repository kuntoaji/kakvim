local opt = vim.opt

-- Set to true if your terminal uses a Nerd Font (https://www.nerdfonts.com).
-- It turns on file icons in the file tree, finder and which-key popup
vim.g.have_nerd_font = false

-- Don't wrap long lines
opt.wrap = false

-- Use 2 spaces for tabs
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smarttab = true

-- Enable line numbers and don't make them any wider than necessary
opt.number = true
opt.numberwidth = 2

-- Keep the sign column visible so Git and diagnostic signs don't shift text
opt.signcolumn = 'yes'

-- Search is case-insensitive unless the pattern has an uppercase letter
opt.ignorecase = true
opt.smartcase = true

-- Open new splits below and to the right
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.background = 'dark'
opt.undofile = true
opt.scrolloff = 4

-- Show completion as you type from the buffer, other windows, other buffers,
-- and the LSP server (omnifunc). Replaces Supertab
opt.autocomplete = true
opt.complete = '.,w,b,o'
opt.completeopt = 'menuone,noselect,popup,fuzzy'
