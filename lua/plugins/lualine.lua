return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
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

        require('lualine').setup {
            options = {
                globalstatus = true,
            },
            sections = {
                lualine_x = { 'fileformat', 'filetype', python_venv },
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
    end
}
