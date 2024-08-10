return {
    "mbbill/undotree",
    keys = {
        { "UD", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" }
    },
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_UndoDir = '~/.cache/nvim/undo'
    end
}
