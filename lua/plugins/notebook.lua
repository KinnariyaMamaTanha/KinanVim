return {
    {
        "GCBallesteros/jupytext.nvim",
        ft = "python",
        opts = {
            style = "hydrogen",
            output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
            force_ft = nil,            -- Default filetype. Don't change unless you know what you are doing
            custom_language_formatting = {},
        }
    },
    {
        "Vigemus/iron.nvim",
        keys = {
            { "<leader>nb", "<cmd>IronRepl<cr>",    mode = "n", { silent = true, noremap = true } },
            { "<leader>nr", "<cmd>IronRestart<cr>", mode = "n", { silent = true, noremap = true } },
            { "<leader>nh", "<cmd>IronHide<cr>",    mode = "n", { silent = true, noremap = true } },
        },
        cmd = { "IronRepl" },
        config = function()
            local iron = require("iron.core")
            iron.setup({
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        sh = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = { "zsh" }
                        },
                        python = {
                            command = { "ipython" }, -- or { "ipython", "--no-autoindent" }
                        }
                    },
                    repl_open_cmd = require("iron.view").split.vertical.botright(0.45),
                },
                keymaps = {
                    send_motion = "<leader>sc",
                    visual_send = "<leader>sc",
                    send_file = "<leader>sf",
                    send_line = "<leader>sl",
                    send_paragraph = "<leader>sp",
                    send_until_cursor = "<leader>su",
                    send_mark = "<leader>sm",
                    mark_motion = "<leader>mc",
                    mark_visual = "<leader>mc",
                    remove_mark = "<leader>md",
                    cr = "<leader>s<cr>",
                    interrupt = "<leader>s<leader>",
                    exit = "<leader>sq",
                    clear = "<leader>cl",
                },
                ignore_blank_lines = true,
            })
        end
    },
}
