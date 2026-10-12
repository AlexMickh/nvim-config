vim.lsp.config("prisma-language-server", {
    cmd = { 'prisma-language-server', '--stdio' },
    filetypes = { 'prisma' },
})
