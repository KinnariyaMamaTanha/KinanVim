return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = " "
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local function python_venv()
            local function env_cleanup(venv)
                if string.find(venv, "/") then
                    local final_venv = venv
                    for w in venv:gmatch("([^/]+)") do
                        final_venv = w
                    end
                    venv = final_venv
                end
                return venv
            end
            if vim.bo.filetype == "python" then
                local venv = os.getenv("CONDA_DEFAULT_ENV")
                if venv then
                    return string.format("%s", env_cleanup(venv))
                end
                venv = os.getenv("VIRTUAL_ENV")
                if venv then
                    return string.format("%s", env_cleanup(venv))
                end
            end
            return ""
        end
        opts = {
            options = {
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "lazy", "startuptime" } },
            },
            sections = {
                lualine_c = {
                    { 'filetype', icon_only = true,                 separator = "", padding = { left = 1, right = 0 } },
                    { 'filename', padding = { left = 0, right = 0 } }
                },
                lualine_x = { 'fileformat', python_venv },
                lualine_y = {
                    { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date("%R")
                    end,
                },
            },
        }
        return opts
    end,
}
