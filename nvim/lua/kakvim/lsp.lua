-- Server definitions come from nvim-lspconfig (lsp/ruby_lsp.lua).
-- Install the server with: gem install ruby-lsp
vim.lsp.enable('ruby_lsp')

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
})
