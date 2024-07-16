return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
    config = true,
    build = ":MasonUpdate",
}
