local function is_in_tbl(val, tbl)
    for _, v in ipairs(tbl) do
        if val == v then
            return true
        end
    end
    return false
end

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
        -- For python virtual env
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
                    return " " .. string.format("%s", env_cleanup(venv))
                end
                venv = os.getenv("VIRTUAL_ENV")
                if venv then
                    return " " .. string.format("%s", env_cleanup(venv))
                end
            end
            return ""
        end
        -- For python virtual env end

        -- For wakatime
        local uv = require("luv")

        local current_time = ""
        local function set_interval(interval, callback)
            local timer = uv.new_timer()
            local function ontimeout()
                callback(timer)
            end
            uv.timer_start(timer, interval, interval, ontimeout)
            return timer
        end

        local function update_wakatime()
            local stdin = uv.new_pipe()
            local stdout = uv.new_pipe()
            local stderr = uv.new_pipe()

            local handle, pid =
                uv.spawn(
                -- TODO: Change this to your path
                    os.getenv("HOME") .. "/.wakatime/wakatime-cli-linux-amd64",
                    {
                        args = { "--today" },
                        stdio = { stdin, stdout, stderr }
                    },
                    function(code, signal) -- on exit
                        stdin:close()
                        stdout:close()
                        stderr:close()
                    end
                )

            uv.read_start(
                stdout,
                function(err, data)
                    assert(not err, err)
                    if data then
                        current_time = data:sub(1, #data - 2)
                    end
                end
            )
        end

        set_interval(60000, update_wakatime)

        local function get_wakatime()
            return current_time
        end
        -- For wakatime end

        opts = {
            options = {
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "lazy", "startuptime", "mason", "calendar" } },
                section_separators = '',
                component_separators = ''
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        icons_enabled = true,
                        fmt = function(str) return str:sub(1, 1) end,
                        color = { bg = 'bg', fg = '#7dcfff' },
                    }
                },
                lualine_b = {
                    {
                        'branch',
                        color = { bg = 'bg', fg = '#ff9e64' },
                        on_click = function()
                            vim.cmd('Flogsplit')
                        end
                    },
                    {
                        'diff',
                        color = "Normal",
                        padding = { left = 0, right = 1 },
                        on_click = function()
                            vim.cmd('Gitsigns diffthis')
                        end
                    },
                },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'coc' },
                        padding = { left = 0, right = 0 },
                        on_click = function()
                            vim.cmd [[
                                call coc#rpc#request('fillDiagnostics', [bufnr('%')])
                                Trouble loclist
                            ]]
                        end
                    },
                    {
                        'filetype',
                        icon_only = true,
                        separator = "",
                        padding = { left = 1, right = 0 },
                        icon = { align = 'right' },
                        on_click = function()
                            vim.cmd("CocCommand explorer")
                        end
                    },
                    {
                        'filename',
                        padding = { left = 0, right = 0 },
                        symbols = {
                            modified = '', -- Text to show when the file is modified.
                            readonly = '', -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[Unnamed]', -- Text to show for unnamed buffers.
                            newfile = '', -- Text to show for newly created file before first write
                        },
                        on_click = function()
                            vim.cmd("CocCommand explorer")
                        end
                    },
                    {
                        function()
                            local filetype = vim.bo.filetype
                            local types = { 'c', 'cpp', 'python', 'markdown', 'tex', 'lua' }
                            if is_in_tbl(filetype, types) then
                                return ""
                            else
                                return ''
                            end
                        end,
                        color = { bg = 'bg', fg = "#c3e88d" },
                        padding = { left = 1, right = 0 },
                        on_click = function()
                            vim.cmd('lua Compile_and_run_single_file()')
                        end
                    },
                    {
                        function()
                            local filetype = vim.bo.filetype
                            local types = { 'c', 'cpp', 'python' }
                            if is_in_tbl(filetype, types) then
                                return ""
                            else
                                return ''
                            end
                        end,
                        color = { bg = 'bg', fg = "#ff757f" },
                        padding = { left = 1, right = 0 },
                        on_click = function()
                            require('dapui').toggle()
                        end
                    },
                    {
                        function()
                            local filetype = vim.bo.filetype
                            local types = { 'c', 'cpp', 'python', 'sh' }
                            if is_in_tbl(filetype, types) then
                                return ''
                            else
                                return ''
                            end
                        end,
                        color = { bg = 'bg', fg = "#7aa2f7" },
                        padding = { left = 1, right = 1 },
                        on_click = function()
                            vim.cmd('CopilotChatToggle')
                        end
                    },
                    {
                        get_wakatime,
                        icon = "󱑆",
                        color = { bg = 'bg', fg = '#41a6b5' }
                    }
                },
                lualine_x = {
                    {
                        python_venv,
                        padding = { left = 1, right = 0 },
                        on_click = function()
                            vim.cmd('Condac')
                        end,
                        color = { bg = "bg", fg = "#7dcfff" }
                    },
                },
                lualine_y = {
                    {
                        "progress",
                        padding = { left = 1, right = 0 },
                        on_click = function()
                            vim.cmd('Outline')
                        end,
                        color = { bg = 'bg', fg = '#9d7cd8' }
                    },
                    {
                        "location",
                        padding = { left = 0, right = 0 },
                        on_click = function()
                            vim.cmd('Outline')
                        end,
                        color = { bg = 'bg', fg = '#9d7cd8' }
                    },
                },
                lualine_z = {
                    {
                        function()
                            return ''
                        end,
                        color = { bg = 'bg', fg = '#ff007c' },
                        padding = { left = 1, right = 1 },
                        on_click = function()
                            local is_playing = vim.fn.system("pgrep mpv")
                            if is_playing ~= "" then
                                vim.cmd('StopMusic')
                            else
                                vim.cmd('PlayMusic')
                            end
                        end
                    },
                    {
                        function()
                            return "󰄀"
                        end,
                        color = { bg = 'bg', fg = "#ff9e64" },
                        padding = { left = 1, right = 1 },
                        on_click = function()
                            vim.cmd('CodeSnapSave')
                        end
                    },
                    {
                        function()
                            return ""
                        end,
                        color = { bg = 'bg', fg = "#7aa2f7" },
                        padding = { left = 1, right = 1 },
                        on_click = function()
                            vim.cmd('TodoTelescope')
                        end
                    },
                    {
                        function()
                            return ""
                        end,
                        color = { bg = 'bg', fg = "#41a6b5" },
                        padding = { left = 1, right = 1 },
                        on_click = function()
                            vim.cmd('Calendar')
                        end
                    },
                    {
                        function()
                            return " " .. os.date("%R")
                        end,
                        color = { bg = "bg", fg = "#c3e88d" },
                        on_click = function()
                            print("Time now: " .. os.date() .. "\n")
                        end
                    },
                },
            },
            extensions = { "fugitive", "man", "lazy", "nvim-dap-ui", "toggleterm", "trouble" }
        }
        return opts
    end,
}
