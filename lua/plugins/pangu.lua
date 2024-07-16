return {
    "hotoo/pangu.vim",
    ft = "markdown",
    config = function()
        vim.cmd [[
            autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing('ALL')
            let g:pangu_rule_date = 1
            let g:pangu_rule_fullwidth_punctuation = 0
            let g:pangu_punctuation_ellipsis = "……"
        ]]
    end
}
