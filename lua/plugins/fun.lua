return {
    {
        "iqxd/vim-mine-sweeping",
        cmd = { "MineSweep" }
    },
    {
        "Febri-i/snake.nvim",
        cmd = { "SnakeStart" },
        dependencies = {
            "Febri-i/fscreen.nvim"
        },
        config = true,
    }
}
