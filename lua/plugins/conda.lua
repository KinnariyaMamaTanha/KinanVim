return {
    "kmontocam/nvim-conda",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "CondaActivate", "CondaDeactivate", "Condac", "Condad" },
    config = function()
        vim.cmd [[
            " Define a function to activate Conda and then restart Coc
            function! CondaDeactivateAndRestart()
                " Call the CondaActivate command
                execute "CondaDeactivate"
                execute 'lua require("notify")("The environment ' . a:1 . ' is deactivated.", "info", { title = "nvim-onda" })'
                silent! execute "CocRestart" | autocmd! CondaCoc
            endfunction

            " Define a function to activate Conda with an optional environment and then restart Coc silently
            function! CondaActivateAndRestart(...)
                " Check if the environment parameter is provided
                if a:0 > 0
                    let env = a:1
                    execute 'CondaActivate' a:1
                    silent! execute 'CocRestart'
                    execute 'lua require("notify")("The environment ' . a:1 . ' is activated.", "info", { title = "nvim-conda" })'
                else
                    execute 'CondaActivate'
                    " Set up an autocommand to run CocRestart silently after the buffer changes
                    augroup CondaCoc
                        autocmd!
                        autocmd BufEnter * silent! execute "CocRestart" | autocmd! CondaCoc
                    augroup END
                end
            endfunction

            " Create a custom command to call the function with a parameter
            command! -nargs=? Condac call CondaActivateAndRestart(<f-args>)

            " command! Condac call CondaActivateAndRestart()
            command! Condad call CondaDeactivateAndRestart()
        ]]
    end
}
