return {
    {
        "dhruvasagar/vim-table-mode",
        cmd = "TableModeToggle",
        config = function()
            vim.g.table_mode_corner = '|'
            vim.g.table_mode_header_fillchar = '-'
        end
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        ft = { "markdown" },
        opts = {
            code = {
                -- Amount of padding to add to the left of code blocks
                left_pad = 2,
                sign = false,
            },
            latex = {
                enabled = false,
            },
            pipe_table = {
                border = { '╭', '┬', '╮', '├', '┼', '┤', '╰', '┴', '╯', '│', '─' },
                alignment_indicator = '┅',
                cell = 'overlay'
            },
            quote = {
                repeat_linebreak = true
            },
            heading = {
                position = "inline"
            }
        },
    },
    {
        "jbyuki/nabla.nvim",
        keys = {
            { "MT", "<cmd>lua require('nabla').popup()<CR>", mode = "n", { silent = true, noremap = true } }
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {}
    },
}
