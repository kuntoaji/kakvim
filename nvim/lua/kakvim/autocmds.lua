local group = vim.api.nvim_create_augroup('kakvim', { clear = true })

-- Automatically remove all trailing whitespace, keeping the cursor and view
vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  callback = function()
    if not vim.bo.modifiable then
      return
    end
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function()
    vim.hl.on_yank()
  end,
})
