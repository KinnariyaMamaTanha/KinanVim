return {
    "fedepujol/move.nvim",
    keys = {
        { '<A-Down>', '<cmd>MoveLine(1)<CR>',  mode = { 'n', 'v' }, { noremap = true, silent = true } },
        { '<A-Up>',   '<cmd>MoveLine(-1)<CR>', mode = { 'n', 'v' }, { noremap = true, silent = true } },
    },
    opts = {
        line = {
            enable = true, -- Enables line movement
            indent = true  -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true  -- Toggles indentation
        },
        word = {
            enable = false, -- Enables word movement
        },
        char = {
            enable = false -- Enables char movement
        }
    }
}
