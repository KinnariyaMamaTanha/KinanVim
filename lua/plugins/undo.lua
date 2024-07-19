return {
    "debugloop/telescope-undo.nvim",
    keys = {
        { "UD", "<cmd>Telescope undo<cr>" },
    },
    config = function()
        vim.keymap.set("n", "UD", "<cmd>Telescope undo<CR>")
    end
}
