local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

vim.keymap.set({ 'n', 'i' }, '<F6>', function() require('dapui').toggle() end)
vim.keymap.set({ 'n', 'i' }, '<F8>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F9>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<C-e>', function() require('dapui').eval() end)

return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F6>", function() require('dapui').toggle() end },
            { "<F8>", function() require('dap').toggle_breakpoint() end },
        },
        config = function()
            local dap = require('dap')
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    args = { "--port", "${port}" },
                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        keys = {
            { "<F6>", function() require('dapui').toggle() end },
        },
        config = function()
            require("dapui").setup({})
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            require("dap-python").setup("python")
        end
    }
}
