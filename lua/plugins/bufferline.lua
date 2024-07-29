return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
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
                always_show_bufferline = false,
                separator_style = 'slant',
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                },
                offsets = {
                    {
                        filetype = "coc-explorer",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "right"
                    },
                    {
                        filetype = "Outline",
                        text = "Outline",
                        highlight = "Directory",
                        text_align = "left"
                    },
                },
                numbers = 'ordinal'
            }
        }
    end
}
