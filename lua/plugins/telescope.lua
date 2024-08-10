return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
        { "<leader>f",  "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { "<leader>c",  "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "<leader>b",  "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { "<leader>m",  "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<leader>cl", "<cmd>lua require('telescope.builtin').colorscheme()<cr>" },
        { "<leader>q",  "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>" },
        { "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>" },
        { "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>" },
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
