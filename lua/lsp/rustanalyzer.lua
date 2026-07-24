vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rs" },
  on_attach = function(client, bufnr)
    -- Disable rust-analyzer formatting capabilities completely
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
