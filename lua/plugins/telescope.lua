return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
        { "<leader>f",  "<cmd>lua require('telescope.builtin').find_files()<cr>",   desc = "Find Files" },
        { "<leader>c",  "<cmd>lua require('telescope.builtin').live_grep()<cr>",    desc = "Find Contents" },
        { "<leader>b",  "<cmd>lua require('telescope.builtin').buffers()<cr>",      desc = "Find Buffers" },
        { "<leader>m",  "<cmd>lua require('telescope.builtin').oldfiles()<cr>",     desc = "Recent Files" },
        { "<leader>cl", "<cmd>lua require('telescope.builtin').colorscheme()<cr>",  desc = "Change colorschemes" },
        { "<leader>q",  "<cmd>lua require('telescope.builtin').quickfix()<cr>",     desc = "Open Quickfix" },
        { "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>",  desc = "View Git Commits" },
        { "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", desc = "View Git Branches" },
        { "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>",   desc = "View Git Status" },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                history = {
                    -- TODO: Change the path to your favorite
                    path = "~/.cache/nvim/telescope_history"
                },
                mappings = {
                    i = {
                        ["<C-q>"] = require('telescope.actions').close,
                    },
                    n = {
                        ["<C-q>"] = require('telescope.actions').close,
                        ["q"] = require('telescope.actions').close,
                    },
                }
            },
            extensions = {},
        }
    end
}
