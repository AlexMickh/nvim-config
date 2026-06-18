require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'gopls', 'neocmake', 'ts_ls', 'rust_analyzer' }
})
