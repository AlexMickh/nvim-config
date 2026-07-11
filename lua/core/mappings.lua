vim.g.mapleader = " "

-- neotree
vim.keymap.set('n', '<leader>e', ':Neotree position=float reveal<CR>')

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true })    
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, silent = true })    
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, silent = true })    
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, silent = true })    
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })    
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, silent = true })
  end
})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope references', noremap = true, silent = true })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope definition', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fx', builtin.quickfix)
vim.keymap.set('n', '<leader>fs', builtin.grep_string) 
vim.keymap.set('n', '<leader>fr', builtin.lsp_references) 
vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls) 

-- bufferline
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", "<Cmd>bdelete!<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { silent = true })

-- treesitter-context
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- windows
vim.keymap.set('n', '<leader>sv', '<Cmd>vnew<CR>')
vim.keymap.set('n', '<leader>sh', '<Cmd>new<CR>')
-- vim.keymap.set('n', '<C-j>', '<Cmd>wincmd j<CR>')
-- vim.keymap.set('n', '<C-k>', '<Cmd>wincmd k<CR>')
-- vim.keymap.set('n', '<C-l>', '<Cmd>wincmd l<CR>')
-- vim.keymap.set('n', '<C-h>', '<Cmd>wincmd h<CR>')

