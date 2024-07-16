return {
    "fedepujol/move.nvim",
    cmd = { "MoveLine", "MoveHChar", "MoveBlock", "MoveHBlock" },
    keys = {
        { '<A-Down>',  ':MoveLine(1)<CR>',    mode = 'n' },
        { '<A-Up>',    ':MoveLine(-1)<CR>',   mode = 'n' },
        { '<A-Left>',  ':MoveHChar(-1)<CR>',  mode = 'n' },
        { '<A-Right>', ':MoveHChar(1)<CR>',   mode = 'n' },
        { '<A-Down>',  ':MoveBlock(1)<CR>',   mode = 'v' },
        { '<A-Up>',    ':MoveBlock(-1)<CR>',  mode = 'v' },
        { '<A-Left>',  ':MoveHBlock(-1)<CR>', mode = 'v' },
        { '<A-Right>', ':MoveHBlock(1)<CR>',  mode = 'v' },
    },
    config = function()
        require('move').setup({
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
        })
        local opts = { noremap = true, silent = true }
        -- Normal-mode commands
        vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
        vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
        vim.keymap.set('n', '<A-Left>', ':MoveHChar(-1)<CR>', opts)
        vim.keymap.set('n', '<A-Right>', ':MoveHChar(1)<CR>', opts)
        -- Visual-mode commands
        vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
        vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
        vim.keymap.set('v', '<A-Left>', ':MoveHBlock(-1)<CR>', opts)
        vim.keymap.set('v', '<A-Right>', ':MoveHBlock(1)<CR>', opts)
    end
}
