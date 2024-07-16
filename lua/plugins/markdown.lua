return {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { "markdown" },
    config = function()
        require('render-markdown').setup({})
        vim.keymap.set("n", "<C-m><C-k>", ":RenderMarkdownToggle<CR>")
    end
}
