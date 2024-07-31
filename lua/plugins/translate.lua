return {
    "potamides/pantran.nvim",
    keys = {
        { "<leader><leader>", "<cmd>Pantran<CR>", { silent = true, noremap = true } },
    },
    config = function()
        require("pantran").setup {
            default_engine = "google",
            engines = {
                google = {
                    default_source = "auto",
                    default_target = "zh-CN"
                }
            },
            window = {
                window_config = {
                    border = "rounded",
                }
            },
            controls = {
                mappings = {
                    edit = {
                        n = {
                            ["j"] = "gj",
                            ["k"] = "gk",
                            ["yo"] = require("pantran.ui.actions").yank_close_translation,
                            ["yi"] = require("pantran.ui.actions").yank_close_input,
                            ["t"] = require("pantran.ui.actions").select_target,
                            ["e"] = require("pantran.ui.actions").select_engine,
                            ["s"] = require("pantran.ui.actions").select_source,
                            ["S"] = require("pantran.ui.actions").switch_languages,
                            ["r"] = require("pantran.ui.actions").replace_close_translation,
                            ["?"] = require("pantran.ui.actions").help,
                            ["<C-q>"] = require("pantran.ui.actions").close,
                        },
                        i = {
                            ["<C-y>"] = require("pantran.ui.actions").yank_close_translation,
                            ["<C-q>"] = require("pantran.ui.actions").close,
                            ["<C-t>"] = require("pantran.ui.actions").select_target,
                            ["<C-e>"] = require("pantran.ui.actions").select_engine,
                            ["<C-s>"] = require("pantran.ui.actions").select_source,
                            ["<C-S>"] = require("pantran.ui.actions").switch_languages,
                            ["<C-r>"] = require("pantran.ui.actions").replace_close_translation,
                            ["<C-?>"] = require("pantran.ui.actions").help,
                        }
                    }
                }
            }
        }
        vim.keymap.set({ "n", "v" }, "<leader><leader>", "<cmd>Pantran<CR>", { silent = true, noremap = true })
    end
}
