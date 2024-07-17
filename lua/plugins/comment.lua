return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup({
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<leader>ci',
                    -- Block-comment toggle keymap
                    block = '<leader>cbi',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = '<leader>ci',
                    ---Block-comment keymap
                    block = '<leader>cbl',
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = '<leader>cO',
                    ---Add comment on the line below
                    below = '<leader>co',
                    ---Add comment at the end of line
                    eol = '<leader>cA',
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = false,
                },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "TD", "<cmd>TodoTelescope<CR>", mode = "n" }
        },
        config = function()
            vim.keymap.set("n", "TD", "<cmd>TodoTelescope<CR>", { silent = true })
            require("todo-comments").setup()
        end
    }
}
