return {
    "folke/flash.nvim",
    opts = {
        modes = {
            char = {
                jump_labels = true
            },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash"
        },
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter"
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash"
        },
        {
            "R",
            mode = { "o", "x" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Search"
        },
        {
            "<c-s>",
            mode = { "c" },
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash Search"
        },
        {
            "gw",
            mode = "n",
            function()
                require("flash").jump({
                    pattern = vim.fn.expand("<cword>"),
                })
            end,
            desc = "Search Word Under Cursor"
        },
        {
            "gl",
            mode = "n",
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^"
                })
            end,
            desc = "Go To Lines"
        }
    },
}
