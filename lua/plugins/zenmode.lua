return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            { "<C-l>", "<cmd>ZenMode<cr>" },
        },
        config = function()
        end
    },
    {
        "folke/twilight.nvim",
        dependencies = { "folke/zen-mode.nvim" },
        lazy = true,
    },
}
