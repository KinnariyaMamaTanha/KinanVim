return {
    "neoclide/coc.nvim",
    branch = "release",
    event = "VeryLazy",
    config = function()
        vim.g.coc_global_extensions = {
            'coc-sh',
            'coc-json',
            'coc-vimlsp',
            'coc-pyright',
            'coc-clangd',
            'coc-markdownlint',
            'coc-git',
            'coc-explorer',
            'coc-snippets',
            'coc-word',
            'coc-yank',
            'coc-pydocstring',
            'coc-docker',
            'coc-ecdict',
            'coc-webview',
            'coc-markdown-preview-enhanced',
            'coc-html',
            'coc-texlab',
            'coc-pairs',
        }
        local keyset = vim.keymap.set
        -- Autocomplete
        function _G.check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        -- Use Tab for trigger completion with characters ahead and navigate
        -- NOTE: There's always a completion item selected by default, you may want to enable
        -- no select by setting `"suggest.noselect": true` in your configuration file
        -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
        -- other plugins before putting this into your config
        local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
        keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
            opts)
        keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
        -- Make <CR> to accept selected completion item or notify coc.nvim to format
        -- <C-g>u breaks current undo, please make your own choice
        keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
        -- Use <c-j> to trigger snippets
        keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
        -- Use <c-space> to trigger completion
        keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
        -- GoTo code navigation
        keyset("n", "gd", "<cmd>call CocAction('jumpDefinition', v:false)<cr>", { silent = true })
        keyset("n", "gy", "<cmd>call CocAction('jumpTypeDefinition', v:false)<cr>", { silent = true })
        keyset("n", "gi", "<cmd>call CocAction('jumpImplementation', v:false)<cr>", { silent = true })
        keyset("n", "gr", "<cmd>call CocAction('jumpReferences', v:false)<cr>", { silent = true })
        -- Use `[d` and `]d` to navigate diagnostics
        -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
        keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
        keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
        -- Use K to show documentation in preview window
        function _G.show_docs()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.api.nvim_eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end

        keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
        -- Symbol renaming
        keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
        -- Apply codeAction to the selected region
        -- Example: `<leader>aap` for current paragraph
        local opts = { silent = true, nowait = true }
        -- Add `:Format` command to format current buffer
        vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
        -- " Add `:Fold` command to fold current buffer
        vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
        -- Add `:OR` command for organize imports of the current buffer
        vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
        keyset("n", "sa", "<Plug>(coc-codeaction-source)", { silent = true, noremap = true })
        keyset("n", "cl", "<Plug>(coc-codeaction-line)", { silent = true, noremap = true })
        keyset("x", "ca", "<Plug>(coc-codeaction-selected)", { silent = true, noremap = true })
        keyset("n", "ca", "<Plug>(coc-codeaction)", { silent = true, noremap = true })
        keyset("n", "qf", "<Plug>(coc-fix-current)", { silent = true, noremap = true })
        keyset({ "n", "i" }, "<A-f>", "<Plug>(coc-float-jump)", { silent = true, noremap = true })
        -- " Manually kill coc PID if failed
        vim.cmd [[autocmd VimLeavePre * if get(g:, 'coc_process_pid', 0)
       	        \ | call system('kill -9 '.g:coc_process_pid) | endif]]
        -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold"
        })
        ----------------------
        ---- coc-explorer ----
        ----------------------
        keyset("n", "<leader>e", "<cmd>CocCommand explorer<CR>", { silent = true, noremap = true })
        keyset("n", "<F2>", "<cmd>CocCommand explorer<CR>", { silent = true, noremap = true })
        ------------------------
        ---- rename symbols ----
        ------------------------
        keyset("n", "rn", "<Plug>(coc-rename)", { silent = true, noremap = true })
        ------------------
        ---- refactor ----
        ------------------
        keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true, noremap = true })
        keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true, noremap = true })
        keyset("v", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true, noremap = true })
        -------------------
        ---- inlayhint ----
        -------------------
        keyset("n", "<leader>i", "<cmd>CocCommand document.toggleInlayHint<CR>", { silent = true, noremap = true })
        ------------------
        ---- coc-yank ----
        ------------------
        -- " show yank list
        keyset("n", "<leader>y", "<cmd>CocList -A --normal yank<CR>", { silent = true, noremap = true })
        -- " clean yank history
        keyset("n", "<leader>yc", "<cmd>CocCommand yank.clean<CR>", { silent = true, noremap = true })
        -----------------
        ---- coc-git ----
        -----------------
        -- " navigate chunks of current buffer
        keyset("n", "[g", "<Plug>(coc-git-prevchunk)", opts)
        keyset("n", "]g", "<Plug>(coc-git-nextchunk)", opts)
        -- " navigate chunks of conflicts
        keyset("n", "[c", "<Plug>(coc-git-prevconflict)", opts)
        keyset("n", "]c", "<Plug>(coc-git-nextchunkict)", opts)
        -- " show chunk diff at current position
        keyset("n", "df", "<Plug>(coc-git-chunkinfo)", opts)
        -- " show commit contains current position
        keyset("n", "cm", "<Plug>(coc-git-commit)", opts)
        -- " show git status with coc-list
        keyset("n", "gs", "<cmd><C-u>CocList --normal gstatus<CR>", opts)
        ---------------------------------------
        ---- coc-markdown-preview-enhanced ----
        ---------------------------------------
        keyset("n", "<C-m><C-k>", "<cmd>CocCommand markdown-preview-enhanced.openPreview<CR>", opts)
        --------------------
        ---- coc-texlab ----
        --------------------
        keyset("n", "<leader>fs", "<cmd>CocCommand latex.ForwardSearch<CR>", opts)
        --------------------------
        ---- multiple cursors ----
        --------------------------
        keyset("n", "<C-c>", "<Plug>(coc-cursors-word)", opts)
    end
}
