if not _G.UI.Bufferline then
    return {}
end
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    keys = {
        { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>",  desc = "GoTo Buffer 1" },
        { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>",  desc = "GoTo Buffer 2" },
        { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>",  desc = "GoTo Buffer 3" },
        { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>",  desc = "GoTo Buffer 4" },
        { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>",  desc = "GoTo Buffer 5" },
        { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>",  desc = "GoTo Buffer 6" },
        { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>",  desc = "GoTo Buffer 7" },
        { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>",  desc = "GoTo Buffer 8" },
        { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>",  desc = "GoTo Buffer 9" },
        { "<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>", desc = "GoTo Last Buffer" },
        { "QO",        "<cmd>BufferLineCloseOthers<CR> ",  desc = "Close Other Buffers" },
        { "QH",        "<cmd>BufferLineCloseLeft<CR>",     desc = "Close Left Buffers" },
        { "QL",        "<cmd>BufferLineCloseRight<CR>",    desc = "Close right Buffers" },
        { "<leader>[", "<cmd>BufferLineCyclePrev<CR>",     desc = "GoTo Prev Buffer" },
        { "<leader>]", "<cmd>BufferLineCycleNext<CR>",     desc = "GoTo Next Buffer" },
    },
    opts = {
        options = {
            always_show_bufferline = false,
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
