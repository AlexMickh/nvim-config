local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
})

null_ls.builtins.formatting.clang_format.with({
  extra_args = { "--style", "{BasedOnStyle: Microsoft, IndentWidth: 4}" }
})
