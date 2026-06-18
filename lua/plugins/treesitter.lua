require('nvim-treesitter').setup {
  sync_install = false,
  auto_install = true,
  highlight = {
    enablee = true,
  },
}

require('nvim-treesitter').install { 'cpp', 'c', 'go', 'lua', 'javascript', 'tsx' }
