return {
    -- {
    --     "kkvh/vim-docker-tools",
    --     keys = {
    --         { "DK", "<cmd>DockerToolsToggle<CR>" }
    --     },
    --     config = function()
    --     end
    -- },
    {
        "lpoto/telescope-docker.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        keys = {
            { "DK", "<cmd>lua require('telescope').extensions.docker.docker()<cr>", desc = "Open docker panel" },
        },
        config = function()
            require("telescope").load_extension "docker"
        end
    },
}
