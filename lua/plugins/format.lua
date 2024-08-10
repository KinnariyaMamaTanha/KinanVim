return {
    "stevearc/conform.nvim",
    ft = { "asm", "cmakefile" },
    ops = {
        formatters_by_ft = {
            asm = { "asmfmt" },
            cmake = { "cmake-format" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },

    },
}
