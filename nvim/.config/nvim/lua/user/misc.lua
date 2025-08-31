vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})

vim.api.nvim_create_augroup("LanguageSpecificCommands", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.js",
  command = "!npm run lint:fix | npm run format",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.php",
  command = "!composer run lint | composer run refactor",
})

