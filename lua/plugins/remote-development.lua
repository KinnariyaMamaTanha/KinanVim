if not _G.Remote_Development then
    return {}
end
return {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cmd = "RemoteSSHFSConnect"
}
