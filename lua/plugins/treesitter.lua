return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown", "markdown_inline", "lua", "vim", "vimdoc" },
            auto_install = true,
        })
    end
}
