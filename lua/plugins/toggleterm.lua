return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<F3>", "<cmd>Toggleterm<cr>", mode = { "i", "n" } },
    },
    event = "VeryLazy",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<F3>]],
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        })

        local trim_spaces = false
        vim.keymap.set("v", "<space>s", function()
            -- require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
            require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
            -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        end)

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'JK', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal   = require('toggleterm.terminal').Terminal
        local lazygit    = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = 'float',
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        local yazi       = Terminal:new({
            cmd = "yazi",
            hidden = true,
            direction = 'float',
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        local ipython    = Terminal:new({
            cmd = "ipython",
            hidden = true,
            direction = 'horizontal',
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        local python     = Terminal:new({
            cmd = "python",
            hidden = true,
            direction = 'horizontal',
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        local lazydocker = Terminal:new({
            cmd = "lazydocker",
            hidden = true,
            direction = 'float',
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        function _yazi_toggle()
            yazi:toggle()
        end

        function _ipython_toggle()
            ipython:toggle()
        end

        function _python_toggle()
            python:toggle()
        end

        function _lazydocker_toggle()
            lazydocker:toggle()
        end

        vim.cmd [[
            command! LazyGit lua _lazygit_toggle()
            command! LazyDocker lua _lazydocker_toggle()
            command! Ipython lua _ipython_toggle()
            command! Python lua _python_toggle()
            command! Yazi lua _yazi_toggle()
        ]]
    end
}
