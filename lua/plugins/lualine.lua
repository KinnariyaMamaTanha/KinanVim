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
                disabled_filetypes = { statusline = { "dashboard", "lazy", "startuptime", "mason", "calendar" } },
                section_separators = '',
                component_separators = ''
            },
            sections = {
                lualine_a = {
                    { 'mode', icons_enabled = true, fmt = function(str) return str:sub(1, 1) end }
                },
                lualine_b = {
                    'branch',
                    { 'diff', padding = { left = 0, right = 1 } },
                },
                lualine_c = {
                    { 'diagnostics', sources = { 'coc' } },
                    { 'filetype',    icon_only = true,   separator = "", padding = { left = 1, right = 0 }, icon = { align = 'right' } },
                    {
                        'filename',
                        padding = { left = 0, right = 0 },
                        symbols = {
                            modified = '', -- Text to show when the file is modified.
                            readonly = '', -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[Unnamed]', -- Text to show for unnamed buffers.
                            newfile = '', -- Text to show for newly created file before first write
                        }
                    },
                    { 'seletctioncount', padding = { left = 0, right = 0 } },
                },
                lualine_x = {
                    { 'filesize', padding = { left = 0, right = 1 }, separator = "│" },
                    { python_venv, separator = "│", padding = { left = 1, right = 1 }, },
                    'fileformat',
                },
                lualine_y = {
                    { "progress", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date("%R")
                    end,
                },
            },
            extensions = { "fugitive", "man", "lazy", "nvim-dap-ui", "toggleterm", "trouble" }
        }
        return opts
    end,
}
