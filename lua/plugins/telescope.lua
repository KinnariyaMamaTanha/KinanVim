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
        local mappings = {
            { from = "<leader>f",  to = "<cmd>lua require('telescope.builtin').find_files()<cr>" },
            { from = "<leader>c",  to = "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
            { from = "<leader>b",  to = "<cmd>lua require('telescope.builtin').buffers()<cr>" },
            { from = "<leader>m",  to = "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
            { from = "<leader>cl", to = "<cmd>lua require('telescope.builtin').colorscheme()<cr>" },
            { from = "<leader>q",  to = "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
            { from = "<leader>gc", to = "<cmd>lua require('telescope.builtin').git_commits()<cr>" },
            { from = "<leader>gb", to = "<cmd>lua require('telescope.builtin').git_branches()<cr>" },
            { from = "<leader>gs", to = "<cmd>lua require('telescope.builtin').git_status()<cr>" },
        }
        for _, mapping in ipairs(mappings) do
            vim.keymap.set("n", mapping.from, mapping.to, { noremap = true })
        end
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
            extensions = {
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "webm", "mp4" },
                    find_cmd = "rg"
                }
            },
        }
    end
}
