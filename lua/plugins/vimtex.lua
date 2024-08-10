return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.cmd [[
            let g:tex_flavor='latex'
            " Use `dsm` to delete surrounding math (replacing the default shortcut `ds$`)
            nmap dsm <Plug>(vimtex-env-delete-math)

            " Use `am` and `im` for the inline math text object
            omap am <Plug>(vimtex-a$)
            xmap am <Plug>(vimtex-a$)
            omap im <Plug>(vimtex-i$)
            xmap im <Plug>(vimtex-i$)

            let g:vimtex_syntax_conceal = {
                  \ 'accents': 1,
                  \ 'ligatures': 0,
                  \ 'cites': 1,
                  \ 'fancy': 1,
                  \ 'spacing': 0,
                  \ 'greek': 1,
                  \ 'math_bounds': 0,
                  \ 'math_delimiters': 0,
                  \ 'math_fracs': 0,
                  \ 'math_super_sub': 0,
                  \ 'math_symbols': 0,
                  \ 'sections': 0,
                  \ 'styles': 1,
                  \}

            " Most VimTeX mappings rely on localleader and this can be changed with the
            " following line. The default is usually fine and is the symbol "\".

            " TODO: The username 自驾游 is my user name. You need to replace it with your username!!!
            let g:vimtex_view_general_viewer = '/mnt/c/Users/自驾游/AppData/Local/SumatraPDF/SumatraPDF.exe'
            let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

            " TODO: Change the path to yours
            let g:vimtex_cache_root = '~/.cache/nvim/vimtex'
            let g:vimtex_cache_persistent = 1

            " latexmk settings
            let g:vimtex_compiler_latexmk = {
                \ 'aux_dir' : './aux',
                \ 'out_dir' : './output',
                \ 'callback' : 1,
                \ 'continuous' : 1,
                \ 'executable' : 'latexmk',
                \ 'hooks' : [],
                \ 'options' : [
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}

            let g:vimtex_compiler_latexmk_engines = {
                \ '_'                : '-pdf',
                \ 'pdfdvi'           : '-pdfdvi',
                \ 'pdfps'            : '-pdfps',
                \ 'pdflatex'         : '-pdf',
                \ 'luatex'           : '-lualatex',
                \ 'lualatex'         : '-lualatex',
                \ 'xelatex'          : '-xelatex',
                \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
                \ 'context (luatex)' : '-pdf -pdflatex=context',
                \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
                \}

            let g:vimtex_format_enabled = 1
        ]]
    end
}
