return {
    "natecraddock/workspaces.nvim",
    cmd = { 'WorkspacesOpen', 'WorkspacesAdd', 'WorkspacesAddDir', 'WorkspacesList', 'WorkspacesListDirs', 'WorkspacesRemove', 'WorkspacesRemoveDir' },
    keys = {
        { "wk", "<cmd>Telescope workspaces<CR>" }
    },
    config = function()
        vim.keymap.set("n", "wk", "<cmd>Telescope workspaces<CR>", { silent = true })
        require("workspaces").setup({
            hooks = {
                open = "Telescope find_files",
            },
            path = "/home/kinnariya/.config/nvim/workspaces"
        })
    end
}
