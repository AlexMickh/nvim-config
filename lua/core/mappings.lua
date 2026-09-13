vim.g.mapleader = " "

-- neotree
-- vim.keymap.set('n', '<leader>e', ':Neotree position=float reveal<CR>')

-- oil
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "_", "<CMD>Oil --float<CR>", { desc = "Open parent directory float" })

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
    vim.keymap.set('n', '<space>vr', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format()
    end, { desc = 'Format buffer' })
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

-- formating
vim.keymap.set("n", "<leader>F", function()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)

  local ext = name:match("^.+(%..+)$")
  local is_cpp = ext == ".cpp" or ext == ".cc" or ext == ".cxx" or ext == ".h" or ext == ".hpp" or ext == ".hh" or ext == ".hxx"

  local ft = vim.bo[buf].filetype
  local is_cpp_ft = ft == "cpp" or ft == "cxx" or ft == "cc"

  if not (is_cpp or is_cpp_ft) then
    return
  end

  vim.cmd("%!clang-format -style=file")
end)

-- dbui
vim.keymap.set("n", "<leader>bu", "<Cmd>DBUI<CR>")

-- lazygit
vim.keymap.set("n", "<leader>lg", "<Cmd>LazyGit<CR>")

-- neotest
local neotest = require("neotest")
vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end)

-- dap
local dap = require("dap")
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dv", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dt", function()
  require("dap-go").debug_test()
end)
