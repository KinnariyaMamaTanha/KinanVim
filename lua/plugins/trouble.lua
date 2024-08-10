return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-web-devicons" },
    keys = {
        {
            "<leader>d",
            "<cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>Trouble loclist<CR>",
            mode = "n",
            {
                silent = true, noremap = true
            }
        }
    },
    opts = {
        focus = true,
        auto_preview = true,
        open_no_results = true,
        warn_no_results = false,
        keys = {
            ["sj"] = "jump_split",
            ["sk"] = "jump_split",
            ["sh"] = "jump_vsplit",
            ["sl"] = "jump_vsplit",
        },
        mode = "loclist",
    }
}
