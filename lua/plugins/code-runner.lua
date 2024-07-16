return {
    "CRAG666/code_runner.nvim",
    keys = {
        { "<F5>", ":lua Compile_and_run_single_file()<CR>" }
    },
    config = function()
        -- Map <F5> to call Compile_and_run_single_file function
        vim.api.nvim_set_keymap('n', '<F5>', ':lua Compile_and_run_single_file()<CR>', { noremap = true, silent = true })
        -- Define the Compile_and_run_single_file function
        function Compile_and_run_single_file()
            vim.cmd('w')
            local filetype = vim.bo.filetype
            if filetype == 'c' or filetype == 'cpp' or filetype == 'python' then
                vim.cmd('RunFile')
            elseif filetype == 'markdown' then
                vim.cmd('CocCommand markdown-preview-enhanced.openPreview')
            elseif filetype == 'tex' then
                vim.cmd('VimtexCompile')
            end
        end

        require('code_runner').setup({
            mode = "toggleterm",
            filetype = {
                python = "python -u",
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
        })
    end
}
