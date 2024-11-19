if not _G.UI.Windows then
    return {}
end
return {
    {
        "nvim-zh/colorful-winsep.nvim",
        event = { "WinLeave" },
        opts = {
            no_exec_files = { "lazy.nvim", "TelescopePrompt", "mason" },
        }
    },
    {
        "nyngwang/NeoZoom.lua",
        keys = {
            { "f<CR>", "NeoZoomToggle", mode = "n", { silent = true, nowait = true } }
        },
        config = function()
            require('neo-zoom').setup {
                popup = { enabled = true }, -- this is the default.
                -- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
                -- EXPLAIN: This improves the performance, and you won't see two
                --          identical buffers got updated at the same time.
                -- popup = {
                --   enabled = true,
                --   exclude_filetypes = {},
                --   exclude_buftypes = {},
                -- },
                exclude_buftypes = { 'terminal' },
                -- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
                winopts = {
                    offset = {
                        -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
                        -- top = 0,
                        -- left = 0.17,
                        width = 150,
                        height = 0.85,
                    },
                    -- NOTE: check :help nvim_open_win() for possible border values.
                    border = "thicc" -- 'thicc', -- this is a preset, try it :)
                },
                presets = {
                    {
                        -- NOTE: regex pattern can be used here!
                        filetypes = { 'dapui_.*', 'dap-repl' },
                        winopts = {
                            offset = { top = 0.02, left = 0.26, width = 0.74, height = 0.25 },
                        },
                    },
                    {
                        filetypes = { 'markdown' },
                        callbacks = {
                            function() vim.wo.wrap = true end,
                        },
                    },
                },
            }
            vim.api.nvim_create_autocmd({ 'WinEnter' }, {
                callback = function()
                    local zoom_book = require('neo-zoom').zoom_book

                    if require('neo-zoom').is_neo_zoom_float()
                    then
                        for z, _ in pairs(zoom_book) do vim.wo[z].winbl = 0 end
                    else
                        for z, _ in pairs(zoom_book) do vim.wo[z].winbl = 20 end
                    end
                end
            })
        end
    }
}
