return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                lualine = {
                    transparent = false,
                },
            }
            vim.cmd [[colorscheme onedark]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = true
    }
}
