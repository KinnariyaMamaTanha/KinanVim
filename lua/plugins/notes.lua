return {
    {
        "mayanksuman/vim-notes-markdown",
        cmd = { 'ToDo', 'NoteSearch', 'NoteCreate', 'NoteFuzzySearch', 'NoteFolder', 'NS', 'NC', 'NFS', 'NF' },
        keys = {
            { "<leader>nf",  "<cmd>NoteFolder<CR>" },
            { "<leader>nfs", "<cmd>NoteFuzzySearch<CR>" },
            { "<leader>td",  "<cmd>ToDo<CR>" },
        },
        config = function()
            vim.cmd [[let g:note_markdown_dir = '/home/kinnariya/notes/']]
            vim.keymap.set("n", "<leader>nf", "<cmd>NoteFolder<CR>")
            vim.keymap.set("n", "<leader>nfs", "<cmd>NoteFuzzySearch<CR>")
            vim.keymap.set("n", "<leader>td", "<cmd>ToDo<CR>")
        end
    },
    {
        "jbyuki/nabla.nvim",
        keys = {
            { "MT", "<cmd>lua require(\"nabla\").popup()<CR>", mode = "n", { silent = true, noremap = true } }
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nabla").setup({})
        end
    }
}
