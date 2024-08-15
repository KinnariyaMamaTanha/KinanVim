return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            { "<C-l>", "<cmd>ZenMode<cr>" },
        },
        opts = {
            window = {
                options = {
                    foldcolumn = "0"
                }
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                gitsigns = { enabled = false },
                todo = { enabled = false }
            }
        }
    },
    {
        "folke/twilight.nvim",
        dependencies = { "folke/zen-mode.nvim" },
        lazy = true,
    },
}
