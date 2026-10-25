-- Server definitions come from nvim-lspconfig (lsp/ruby_lsp.lua).
-- Install the server with: gem install ruby-lsp
-- Skip the server when it is not installed, so opening a Ruby file shows no spawn error
if vim.fn.executable('ruby-lsp') == 1 then
  vim.lsp.enable('ruby_lsp')
end

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
})
