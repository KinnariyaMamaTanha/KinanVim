return {
    "debugloop/telescope-undo.nvim",
    keys = {
        { "UD", "<cmd>Telescope undo<cr>" },
    },
    config = function()
        vim.keymap.set("n", "UD", "<cmd>Telescope undo<CR>")
        vim.cmd [[
            if has("persistent_undo")
                let target_path = expand('~/.config/nvim/undo')

                " create the directory and any parent directories
                " if the location does not exist.
                if !isdirectory(target_path)
                    call mkdir(target_path, "p", 0700)
                endif

                let &undodir=target_path
                set undofile
            endif
        ]]
    end
}
