if not _G.Copilot then
    return {}
end
return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        ft = { "c", "cpp", "python" },
        opts = {
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

        }
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
            temperature = 0.7,
            question_header = ' Me ',
            answer_header = "  Copilot ",
            model = "gpt-4",
            context = "buffer",
            -- TODO: Replace it with your favorite path
            history_path = '/home/kinnariya/.cache/nvim/copilotchat_history',
            window = {
                width = 0.5,
            },
            selection = function(source)
                local select = require("CopilotChat.select")
                return select.visual(source) or select.buffer(source)
            end,
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
