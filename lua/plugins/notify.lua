if not _G.Notify then
    return {}
end
return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        require('notify').setup {
            timeout = 2000,
            render = "wrapped-compact",
            stages = "fade"
        }
        -- coc integration
        local coc_status_record = {}
        function coc_status_notify(msg, level)
            local notify_opts = {
                title = "LSP Status",
                timeout = 500,
                hide_from_history = true,
                on_close =
                    reset_coc_status_record
            }
            -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
            if coc_status_record ~= {} then
                notify_opts["replace"] = coc_status_record.id
            end
            coc_status_record = require("notify")(msg, level, notify_opts)
        end

        function reset_coc_status_record(window)
            coc_status_record = {}
        end

        local coc_diag_record = {}

        function coc_diag_notify(msg, level)
            local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
            -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
            if coc_diag_record ~= {} then
                notify_opts["replace"] = coc_diag_record.id
            end
            coc_diag_record = require("notify")(msg, level, notify_opts)
        end

        function reset_coc_diag_record(window)
            coc_diag_record = {}
        end

        require("notify")("Hello, world.", "info", { title = "Kinnariya", timeout = 500 })

        function coc_notify(msg, level)
            local notify_opts = { title = "LSP Message", timeout = 500 }
            require("notify")(msg, level, notify_opts)
        end

        vim.cmd [[
            function! s:DiagnosticNotify() abort
              let l:info = get(b:, 'coc_diagnostic_info', {})
              if empty(l:info) | return '' | endif
              let l:msgs = []
              let l:level = 'info'
               if get(l:info, 'warning', 0)
                let l:level = 'warn'
              endif
              if get(l:info, 'error', 0)
                let l:level = 'error'
              endif

              if get(l:info, 'error', 0)
                call add(l:msgs, ' Errors: ' . l:info['error'])
              endif
              if get(l:info, 'warning', 0)
                call add(l:msgs, ' Warnings: ' . l:info['warning'])
              endif
              if get(l:info, 'information', 0)
                call add(l:msgs, ' Infos: ' . l:info['information'])
              endif
              if get(l:info, 'hint', 0)
                call add(l:msgs, ' Hints: ' . l:info['hint'])
              endif
              let l:msg = join(l:msgs, "\n")
              if empty(l:msg) | let l:msg = ' All OK' | endif
              call v:lua.coc_diag_notify(l:msg, l:level)
            endfunction

            function! s:StatusNotify() abort
              let l:status = get(g:, 'coc_status', '')
              let l:level = 'info'
              if empty(l:status) | return '' | endif
              call v:lua.coc_status_notify(l:status, l:level)
            endfunction

            " notifications
            autocmd User CocDiagnosticChange call s:DiagnosticNotify()
            autocmd User CocStatusChange call s:StatusNotify()
        ]]
    end
}
