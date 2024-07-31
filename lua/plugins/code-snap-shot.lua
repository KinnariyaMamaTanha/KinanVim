local path = vim.fn.expand("~/Pictures")
if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path)
end
return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    cmd = {
        "CodeSnapSave",
        "CodeSnapSaveHighlight",
        "CodeSnapASCII",
    },
    opts = {
        title = "",
        save_path = path,
        has_breadcrumbs = true,
        bg_theme = "default",
        bg_color = "#535c68",
        bg_padding = 0,
        -- TODO: Change the watermark before using this plugin
        watermark = " @KinnariyaMamaTanha",
        has_line_number = true,
        show_workspace = true,
    }
}
