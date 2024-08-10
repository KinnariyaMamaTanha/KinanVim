return {
    "natecraddock/workspaces.nvim",
    cmd = { 'WorkspacesOpen', 'WorkspacesAdd', 'WorkspacesAddDir', 'WorkspacesList', 'WorkspacesListDirs', 'WorkspacesRemove', 'WorkspacesRemoveDir' },
    keys = {
        { "wk", "<cmd>Telescope workspaces<CR>" }
    },
    opts = {
        hooks = {
            open = "Telescope find_files",
        },
        path = "/home/kinnariya/.config/nvim/workspaces"
    }
}
