require("lsp.clangd")
require("plugins.cmp")

vim.lsp.config("*", {  
  root_markers = { ".git" },
})

for _, name in ipairs({  
  "clangd",  
  "cmake_language_server",  
  "gopls",  
  -- "ts_ls",  
  -- "rust_analyzer",
}) do  
  vim.lsp.enable(name)
end

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end
