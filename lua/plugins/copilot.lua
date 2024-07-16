return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    ft = { "c", "cpp", "python" },
    config = function()
        -- Pay attention that the keymaps here is imap
        require('copilot').setup({
            panel = {
                auto_refresh = true,
                keymap = {
                    jump_prev = "<C-k>",
                    jump_next = "<C-j>",
                    accept = "<CR>",
                    open = "<F7>",
                    refresh = "<M-r>",
                }
            },
            suggestion = {
                keymap = {
                    accept = "<M-;>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                }
            },
            filetypes = {
                ["*"] = false,
                cpp = true,
                c = true,
                python = true,
                sh = true
            }
        })
    end
}
