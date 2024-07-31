return {
    {
        "MeanderingProgrammer/markdown.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ft = { "markdown" },
        config = function()
            require('render-markdown').setup({
                code = {
                    -- Amount of padding to add to the left of code blocks
                    left_pad = 1,
                }
            })
            vim.keymap.set("n", "<C-m><C-k>", "<cmd>RenderMarkdownToggle<CR>")
        end
    },
    {
        "dhruvasagar/vim-table-mode",
        cmd = "TableModeToggle",
        config = function()
            vim.g.table_mode_corner = '|'
            vim.g.table_mode_header_fillchar = '-'
        end
    },
}
