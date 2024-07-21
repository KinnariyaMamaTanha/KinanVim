return {
    "ldelossa/nvim-ide",
    cmd = { "Workspace", "Vscode" },
    config = function()
        local timeline = require('ide.components.timeline')
        local changes  = require('ide.components.changes')
        local commits  = require('ide.components.commits')
        local branches = require('ide.components.branches')
        vim.api.nvim_create_user_command("Vscode", "Workspace RightPanelToggle", {})

        require('ide').setup({
            icon_set = "default", -- "default" | "nerd" | "codicon"
            log_level = "info",   -- "info" | "error" | 'debug' | 'warn'
            components = {
                global_keymaps = {
                    hide = "HD",
                    collapse = "h",
                    expand = "l",
                },
            },
            panels = {
                left = "explorer",
                right = "git"
            },
            panel_groups = {
                git = { changes.Name, commits.Name, timeline.Name, branches.Name }
            },
            workspaces = {
                auto_open = 'none',
            },
            panel_sizes = {
                left = 30,
                right = 30,
            }
        })
    end
}
