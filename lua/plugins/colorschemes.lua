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
                    transparent = true,
                },
                highlights = {
                    ["@variable.python"] = { fg = '$red' },
                    ["@operator.python"] = { fg = '$cyan' },
                    ["@operator.c"] = { fg = '$purple' },
                    ["@string.escape.python"] = { fg = '$cyan' },
                    ["@function.call.python"] = { fg = '$blue' },
                    ["@constructor.python"] = { fg = '$cyan' },
                    ["@variable.member.python"] = { fg = '$cyan' },
                    ["@type.builtin.python"] = { fg = '$yellow' },
                    ["@variable.builtin.python"] = { fg = '$yellow', fmt = 'italic' },
                    ["@none.python"] = { fg = '$purple' },
                    ["@markup.strong"] = { fg = '$orange', fmt = 'bold' },
                    ["@markup.italic"] = { fg = '#7dcfff' },
                    ["@markup.math.latex"] = { fg = '$cyan' },
                    DashboardFooter = { fg = '$purple', fmt = "italic" }
                }
            }
            vim.cmd [[colorscheme onedark]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "storm",
        }
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = true,
        opts = {
            italic_comments = true,
            underline_links = true,
        }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
    },
    {
        "uga-rosa/ccc.nvim",
        cmd = {
            "CccPick",
            "CccConvert",
            "CccHighlighterTogggle",
        },
        opts = function()
            vim.api.nvim_command('highlight link CccFloatNormal Normal')
            vim.api.nvim_command('highlight link CccFloatBorder Normal')
        end
    },
}
