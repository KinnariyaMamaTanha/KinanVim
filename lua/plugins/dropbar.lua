if not _G.UI.Dropbar then
    return {}
end
return {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    config = function()
        vim.api.nvim_command('highlight link DropBarMenuNormalFloat Normal')
        require("dropbar").setup()
    end
}
