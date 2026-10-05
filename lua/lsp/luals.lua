vim.lsp.config('lua_ls', {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})
