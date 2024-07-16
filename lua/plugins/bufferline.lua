return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local mappings = {
            { from = "<leader>1", to = "<cmd>BufferLineGoToBuffer 1<CR>" },
            { from = "<leader>2", to = "<cmd>BufferLineGoToBuffer 2<CR>" },
            { from = "<leader>3", to = "<cmd>BufferLineGoToBuffer 3<CR>" },
            { from = "<leader>4", to = "<cmd>BufferLineGoToBuffer 4<CR>" },
            { from = "<leader>5", to = "<cmd>BufferLineGoToBuffer 5<CR>" },
            { from = "<leader>6", to = "<cmd>BufferLineGoToBuffer 6<CR>" },
            { from = "<leader>7", to = "<cmd>BufferLineGoToBuffer 7<CR>" },
            { from = "<leader>8", to = "<cmd>BufferLineGoToBuffer 8<CR>" },
            { from = "<leader>9", to = "<cmd>BufferLineGoToBuffer 9<CR>" },
            { from = "<leader>$", to = "<cmd>BufferLineGoToBuffer -1<CR>" },
            { from = "QO",        to = "<cmd>BufferLineCloseOthers<CR> " },
            { from = "QH",        to = "<cmd>BufferLineCloseLeft<CR>" },
            { from = "QL",        to = "<cmd>BufferLineCloseRight<CR>" },
            { from = "<leader>[", to = "<cmd>BufferLineCyclePrev<CR>" },
            { from = "<leader>]", to = "<cmd>BufferLineCycleNext<CR>" },
        }
        vim.cmd [[command! Pin BufferLineTogglePin]]
        for _, mapping in ipairs(mappings) do
            vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
        end

        require('bufferline').setup {
            options = {
                separator_style = 'slant',
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                },
                diagnostics = "nvim_lsp",
                --- count is an integer representing total count of errors
                --- level is a string "error" | "warning"
                --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
                --- this should return a string
                --- Don't get too fancy as this function will be executed a lot
                -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                --     local s = " "
                --     for e, n in pairs(diagnostics_dict) do
                --         local sym = e == "error" and " "
                --         or (e == "warning" and " " or "" )
                --         s = s .. n .. sym
                --     end
                --     return s
                -- end,
                offsets = {
                    {
                        filetype = "coc-explorer",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left"
                    },
                    {
                        filetype = "Outline",
                        text = "Outline",
                        highlight = "Directory",
                        text_align = "right"
                    },
                    {
                        filetype = "undotree",
                        text = "Undo Tree",
                        highlight = "Directory",
                        text_align = "right"
                    },
                    {
                        filetype = "coctree",
                        text = "ToDo Tree",
                        highlight = "Directory",
                        text_align = "right"
                    },
                },
                numbers = 'ordinal'
            }
        }
    end
}
