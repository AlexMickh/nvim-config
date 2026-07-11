require('nvim-treesitter').setup {
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true, 
  },
  ensure_installed = { "c", "cpp", "go", "lua" },
}
vim.cmd('syntax on')
vim.treesitter.language.register('go', 'go')
vim.treesitter.language.register('cpp', 'cpp')
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'cpp', 'go' }, -- Add your languages here
  callback = function()
    vim.treesitter.start()
  end,
})
-- require('nvim-treesitter').install { 'cpp', 'c', 'go', 'lua', 'javascript', 'tsx' }
