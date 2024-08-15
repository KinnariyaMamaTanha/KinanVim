if _G.Games then
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
                -- TODO: Replace with your favorite path
                scores_path = "/home/kinnariya/.cache/nvim/blackjack_scores.json"
            }
        }
    }
else
    return {}
end
