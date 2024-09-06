if not _G.Search then
    return {}
end
return {
    "FabianWirth/search.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
        { "<leader>s", "<cmd>lua require('search').open()<CR>", { silent = true, noremap = true } },
    },
    config = function()
        local builtin = require('telescope.builtin')
        require("search").setup({
            mappings = { -- optional: configure the mappings for switching tabs (will be set in normal and insert mode(!))
                next = "<Tab>",
                prev = "<S-Tab>"
            },
            -- overwrite the default tabs
            tabs = {
                {
                    "Files",
                    function(opts)
                        opts = opts or {}
                        if vim.fn.isdirectory(".git") == 1 then
                            builtin.git_files(opts)
                        else
                            builtin.find_files(opts)
                        end
                    end
                },
                { name = "MRU",          tele_func = builtin.oldfiles },
                { name = "Live Grep",    tele_func = builtin.live_grep },
                { name = "Colorschemes", tele_func = builtin.colorscheme },
                { name = "Branches",     tele_func = builtin.git_branches },
                { name = "Commits",      tele_func = builtin.git_commits },
            },
        })
    end
}
