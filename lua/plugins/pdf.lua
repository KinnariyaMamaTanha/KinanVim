if not _G.PDF then
    return {}
end
return {
    "makerj/vim-pdf",
    event = "BufReadPre *.pdf",
    config = function() end
}
