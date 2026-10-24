-- Plugins are managed by the built-in vim.pack (:help vim.pack).
-- Exact revisions are pinned in nvim-pack-lock.json. Commit it with every plugin change.

local gh = function(repo)
  return 'https://github.com/' .. repo
end

-- Update Treesitter parsers after nvim-treesitter itself updates.
-- Registered before vim.pack.add() so it also runs on first install
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('kakvim_pack', { clear = true }),
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

-- nvim-tree replaces netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nerd_font = vim.g.have_nerd_font

vim.pack.add({
  -- UI
  gh('ellisonleao/gruvbox.nvim'),
  gh('folke/which-key.nvim'),

  -- Files and search
  gh('nvim-tree/nvim-tree.lua'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),

  -- Git
  gh('tpope/vim-fugitive'),
  gh('lewis6991/gitsigns.nvim'),

  -- Ruby on Rails
  gh('tpope/vim-rails'),
  gh('slim-template/vim-slim'),

  -- Language support
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
  gh('neovim/nvim-lspconfig'),
}, { confirm = false })

if nerd_font then
  vim.pack.add({ gh('nvim-tree/nvim-web-devicons') }, { confirm = false })
end

vim.cmd.colorscheme('gruvbox')

require('which-key').setup({
  icons = { mappings = nerd_font },
  spec = {
    { '<leader>f', group = 'Find' },
    { '<leader>G', group = 'Git' },
    { '<leader>h', group = 'Git hunk' },
    { '<leader>r', group = 'Rails' },
  },
})

require('nvim-tree').setup({
  renderer = {
    icons = {
      show = { file = nerd_font, folder = nerd_font, folder_arrow = nerd_font, git = nerd_font },
    },
  },
})
require('gitsigns').setup()
require('telescope').setup()

-- Treesitter parsers. Installing them needs the tree-sitter CLI and a C compiler
local parsers = { 'ruby', 'embedded_template', 'html', 'css', 'javascript', 'yaml', 'json', 'lua' }
if vim.fn.executable('tree-sitter') == 1 then
  require('nvim-treesitter').install(parsers)
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('kakvim_treesitter', { clear = true }),
  callback = function(ev)
    -- Fall back to regex syntax highlighting when no parser is installed
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
