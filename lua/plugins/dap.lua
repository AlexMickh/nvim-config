local dap = require("dap")
local dapui = require("dapui")

-- require("nvim-dap-envfile").setup()

require("mason-nvim-dap").setup({
    ensure_installed = { "delve" },
    automatic_installation = true,
})

dapui.setup()
require("nvim-dap-virtual-text").setup()
require("dap-go").setup({
    dap_configurations = {
        {
            type = "go",
            name = "Debug App (cmd/app/main.go)",
            request = "launch",
            program = "${workspaceFolder}/cmd/app/main.go", 
          },
    }
})

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75", bg = "NONE" })
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
