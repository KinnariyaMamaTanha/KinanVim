return {
    {
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
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        cmd = {
            "CopilotChat",
            "CopilotChatOpen",
            "CopilotChatClose",
            "CopilotChatToggle",
            "CopilotChatExplain",
            "CopilotChatReview",
            "CopilotChatFix",
            "CopilotChatOptimize",
            "CopilotChatDocs",
            "CopilotChatTests",
        },
        keys = {
            {
                "<leader>cb",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
            {
                "<leader>cp",
                "CopilotChat",
                desc = "Copilot Chat",
            },
        },
        opts = {
            temperature = 0.1,
            question_header = '## Me ',
            context = "buffer",
            history_path = '/home/kinnariya/.config/nvim/copilotchat_history',
            window = {
                width = 0.3,
            },
            mappings = {
                close = {
                    normal = '<C-q>',
                    insert = '<C-q>'
                },
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-s>'
                },
                reset = {
                    normal = '<C-r>',
                    insert = '<C-r>'
                },
            },
        },
    },
}
