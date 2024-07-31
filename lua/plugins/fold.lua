return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            lazy = true,
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup(
                    {
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                            { text = { "%s" },                  click = "v:lua.ScSa" },
                        }
                    }
                )
            end
        }
    },
    event = "BufReadPost",
    config = function()
        -- vim.api.nvim_set_hl(0, "Folded", { bg = "#01579B" }) -- Highlight folded lines
        vim.api.nvim_set_hl(0, "FoldColumn", {}) -- No highlight foldcolumn
        vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zf', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                -- choose one of coc.nvim and nvim lsp
                vim.fn.CocActionAsync('definitionHover') -- coc.nvim
                vim.lsp.buf.hover()
            end
        end)
        vim.keymap.set('n', '[f', "<cmd>lua require('ufo').goPreviousClosedFold()<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', ']f', "<cmd>lua require('ufo').goNextClosedFold()<cr>", { silent = true, noremap = true })

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local totalLines = vim.api.nvim_buf_line_count(0)
            local foldedLines = endLnum - lnum
            local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            local rAlignAppndx = math.max(math.min(vim.api.nvim_win_get_width(0), width - 1) - curWidth - sufWidth, 0)
            suffix = (" "):rep(rAlignAppndx) .. suffix
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end

        require('ufo').setup({
            filetype_exclude = { "help", "dashboard", "Trouble", "lazy", "mason", "Outline", "coc-explorer" },
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
            fold_virt_text_handler = handler,
            open_fold_hl_timeout = 400,
            preview = {
                win_config = {
                    border = { '', '─', '', '', '', '─', '', '' },
                    winhighlight = 'Normal:Folded',
                },
                mappings = {
                    scrollU = '<C-k>',
                    scrollD = '<C-j>',
                    jumpTop = '[',
                    jumpBot = ']'
                }
            },
        })
    end
}
