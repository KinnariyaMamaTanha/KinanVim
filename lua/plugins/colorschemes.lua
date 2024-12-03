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
                    functions = 'bold',
                    strings = 'none',
                    variables = 'none'
                },
                transparent = true,
                lualine = {
                    transparent = true,
                },
                style = "darker",
                highlights = {
                    ["@variable.python"] = { fg = '$red' },
                    ["@variable.bash"] = { fg = '$red' },
                    ["@variable.lua"] = { fg = '$red' },
                    ["@operator.python"] = { fg = '$cyan' },
                    ["@operator.bash"] = { fg = '$cyan' },
                    ["@operator.c"] = { fg = '$purple' },
                    ["@operator.cpp"] = { fg = '$purple' },
                    ["@string.escape.python"] = { fg = '$cyan' },
                    ["@function.call.python"] = { fg = '$blue' },
                    ["@constructor.python"] = { fg = '$blue' },
                    ["@variable.member.python"] = { fg = '$cyan' },
                    ["@type.builtin.python"] = { fg = '$yellow' },
                    ["@variable.builtin.python"] = { fg = '$yellow' },
                    ["@none.python"] = { fg = '$purple' },
                    ["@markup.strong"] = { fg = '$orange', fmt = 'bold' },
                    ["@markup.italic"] = { fg = '#7dcfff' },
                    ["@markup.math.latex"] = { fg = '$cyan' },
                    ["CocSemTypeTypeParameter"] = { fg = '$yellow' },
                    ["CocSemTypeVariable"] = { fg = "$red" },
                    ["CocFloating"] = { bg = "$grey" },
                    ["CocErrorFloat"] = { bg = "$grey" },
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
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = true,
    -- },
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
