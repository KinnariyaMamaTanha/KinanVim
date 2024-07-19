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
    },
    {
        "eandrju/cellular-automaton.nvim",
        cmd = "CellularAutomaton"
    },
    {
        "alec-gibson/nvim-tetris",
        cmd = "Tetris",
    },
    {
        "alanfortlink/blackjack.nvim",
        requires = { 'nvim-lua/plenary.nvim' },
        cmd = "BlackJackNewGame",
        opts = {
            card_style = "large", -- "mini"
            scores_path = "/home/kinnariya/.cache/blackjack_scores.json"
        }
    }
}
