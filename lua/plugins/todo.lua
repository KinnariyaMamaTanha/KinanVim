return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "TD", "<cmd>TodoTelescope<CR>", mode = "n" }
    },
    cmd = { "TodoTelescope" },
    opts = {}
}
