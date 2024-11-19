if not _G.Conda then
    return {}
end
return {
    {
        "KinnariyaMamaTanha/kinaconda",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "neoclide/coc.nvim"
        },
        cmd = {
            "CondaActivate",
            "CondaDeactivate",
        },
        opts = {},
    }
}
