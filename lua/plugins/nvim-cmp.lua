if not _G.Command_Completion then
    return {}
end
return {
    {
        "hrsh7th/cmp-cmdline",
        event = { "CmdlineEnter" },
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
        },
    },
    {
        "hrsh7th/cmp-buffer",
        lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        config = function()
            local cmp = require("cmp")
            local cmp_kinds = {
                Text = ' ',
                Method = ' ',
                Function = ' ',
                Constructor = ' ',
                Field = ' ',
                Variable = ' ',
                Class = ' ',
                Interface = ' ',
                Module = ' ',
                Property = ' ',
                Unit = ' ',
                Value = ' ',
                Enum = ' ',
                Keyword = ' ',
                Snippet = ' ',
                Color = ' ',
                File = ' ',
                Reference = ' ',
                Folder = ' ',
                EnumMember = ' ',
                Constant = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' ',
            }
            local moveCursorBeforeComma = function()
                vim.defer_fn(function()
                    local line = vim.api.nvim_get_current_line()
                    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                    local char = line:sub(col - 2, col)
                    if char == ": ," then
                        vim.api.nvim_win_set_cursor(0, { row, col - 1 })
                    end
                end, 100)
            end
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            -- gray
            vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
            -- blue
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
            -- light blue
            vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
            vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
            vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
            -- pink
            vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
            vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
            -- front
            vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
            vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
            vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

            cmp.setup({
                view = {
                    entries = { name = 'custom', selection_order = 'near_cursor' }
                },
                formatting = {
                    fields = { "kind", "abbr" },
                    format = function(_, vim_item)
                        vim_item.kind = cmp_kinds[vim_item.kind] or ""
                        return vim_item
                    end,
                },
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:Normal",
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping({
                        -- i = function(fallback)
                        --     if cmp.visible() and cmp.get_active_entry() then
                        --         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        --     else
                        --         fallback()
                        --     end
                        -- end,
                        -- s = cmp.mapping.confirm({ select = false }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                    }),
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                                moveCursorBeforeComma()
                            elseif has_words_before() then
                                cmp.complete()
                                moveCursorBeforeComma()
                            else
                                fallback()
                            end
                        end, { "c" }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                                moveCursorBeforeComma()
                            else
                                fallback()
                            end
                        end, { "c" }
                    ),
                }),
                sources = cmp.config.sources({})
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end
    }
}
