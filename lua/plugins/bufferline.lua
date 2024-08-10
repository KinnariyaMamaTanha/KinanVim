return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    keys = {
        { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>" },
        { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>" },
        { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>" },
        { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>" },
        { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>" },
        { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>" },
        { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>" },
        { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>" },
        { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>" },
        { "<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>" },
        { "QO",        "<cmd>BufferLineCloseOthers<CR> " },
        { "QH",        "<cmd>BufferLineCloseLeft<CR>" },
        { "QL",        "<cmd>BufferLineCloseRight<CR>" },
        { "<leader>[", "<cmd>BufferLineCyclePrev<CR>" },
        { "<leader>]", "<cmd>BufferLineCycleNext<CR>" },
    },
    opts = {
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
                {
                    filetype = "undotree",
                    text = "UndoTree",
                    highlight = "Directory",
                    text_align = "left"
                },
            },
            numbers = 'ordinal'
        }
    }
}
