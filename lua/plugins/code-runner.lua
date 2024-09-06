-- Define the Compile_and_run_single_file function
_G.Compile_and_run_single_file = function()
    vim.cmd('w')
    local filetype = vim.bo.filetype
    if filetype == 'c' or filetype == 'cpp' or filetype == 'python' then
        vim.cmd('RunFile')
    elseif filetype == 'markdown' then
        vim.cmd("MarkdownPreview")
    elseif filetype == 'tex' then
        vim.cmd('VimtexCompile')
    elseif filetype == 'lua' then
        vim.cmd("luafile %")
    end
end
return {
    {
        "CRAG666/code_runner.nvim",
        keys = {
            { "<F5>", "<cmd>lua Compile_and_run_single_file()<CR>" }
        },
        cmd = { "RunFile" },
        opts = {
            filetype = {
                python = "python",
                c = {
                    "cd $dir &&",
                    "gcc $fileName -g -o $fileNameWithoutExt &&",
                    "$dir/$fileNameWithoutExt"
                },
                cpp = {
                    "cd $dir &&",
                    "g++ $fileName -g -o $fileNameWithoutExt &&",
                    "$dir/$fileNameWithoutExt"
                },
                bash = "bash $filename"
            },
        }
    },
    {
        "michaelb/sniprun",
        build = "sh install.sh",
        keys = {
            { "<F5>", "<Plug>SnipRun", mode = { "v", "x" } },
        },
        cmd = { "SnipRun", "SnipInfo" },
        opts = {
            display = { "NvimNotify" },
            display_options = {
                notification_timeout = 5 -- timeout for nvim_notify output
            },
        }
    },
}
