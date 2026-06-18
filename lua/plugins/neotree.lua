vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  }
})

require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,      -- This sets dotfiles to be visible
      hide_gitignored = false,     -- Keeps gitignored files hidden
      hide_by_name = {
        '.git', 
      },
    },
  },
})
