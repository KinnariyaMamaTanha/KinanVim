return {
    {
        "theKnightsOfRohan/csvlens.nvim",
        dependencies = { "akinsho/toggleterm.nvim" },
        cmd = "Csvlens",
        config = true,
        opts = {
            -- TODO: Replace this path with your preference
            exec_install_path = "/home/kinnariya/.local/bin"
        }
    },
    {
        "emmanueltouzery/decisive.nvim",
        config = function()
            require('decisive').setup {}
        end,
        ft = { 'csv' },
        keys = {
            { '<leader>al', "<cmd>lua require('decisive').align_csv({})<cr>",        { silent = true }, desc = "Align CSV",          mode = 'n' },
            { '[c',         "<cmd>lua require('decisive').align_csv_prev_col()<cr>", { silent = true }, desc = "Align CSV prev col", mode = 'n' },
            { ']c',         "<cmd>lua require('decisive').align_csv_next_col()<cr>", { silent = true }, desc = "Align CSV next col", mode = 'n' },
        }
    }
}
