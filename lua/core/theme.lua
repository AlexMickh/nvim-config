require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  show_end_of_buffer = false,
  integration_default = true,
  integrations = {
    treesitter = true, 
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})

vim.cmd("colorscheme catppuccin")
