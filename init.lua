require("config.utils")
require("config.global-settings")
require("config.keymaps")
require("config.plugins")
if _G.Notify then
    vim.cmd('source ~/.config/nvim/after/autoload/coc/ui.vim')
end
