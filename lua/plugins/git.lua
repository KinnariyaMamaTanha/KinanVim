return {
    {
        "rbong/vim-flog",
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            {
                "tpope/vim-fugitive",
                lazy = true,
            }
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup({
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                current_line_blame           = true,
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 500,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                show_deleted                 = false,
                current_line_blame_formatter = ' <author>, <author_time:%R> - <summary>',
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'none',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 1,
                    col = 1,
                },
                on_attach                    = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']g', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[g', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', 'df', gitsigns.preview_hunk)
                    map('n', 'cm', gitsigns.blame)
                    map('n', '<leader>gd', gitsigns.diffthis)
                    map('n', '<leader>gD', function() gitsigns.diffthis('~') end)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end
    }
}
