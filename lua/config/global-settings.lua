vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.o.number = true
vim.o.relativenumber = true
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
-- vim.o.scrolloff = 5
-- vim.o.sidescrolloff = 4
vim.o.cursorline = true
-- vim.o.cursorcolumn = true
vim.o.compatible = false
vim.o.hidden = true
vim.o.showmatch = true
vim.o.autochdir = true
vim.o.list = true
vim.o.mouse = "a"
vim.o.mousemodel = "popup_setpos"
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'
vim.o.autowrite = true
vim.o.autoread = true
vim.o.confirm = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.signcolumn = "yes"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.encoding = "utf-8"
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.wildignore = "log/**,node_modules/**,target/**,tmp/**,*.rbc"
vim.o.wildmenu = true
vim.o.wildmode = "longest,list,full"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.cmd [[
    autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " remember the last position of cursor
    " WSL2 yank support
    if system('uname -r') =~ "Microsoft"
        augroup Yank
            autocmd!
            autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
    endif
    " Persistent undo history
    if has("persistent_undo")
        " TODO: Replace with your favorite path
        let target_path = expand('~/.cache/nvim/undo')

        " create the directory and any parent directories
        " if the location does not exist.
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
    endif
]]
vim.o.conceallevel = 2
vim.o.pumblend = 20
vim.o.virtualedit = "block"
vim.o.backspace = "2"
vim.o.timeoutlen = 100
vim.o.updatetime = 100
vim.cmd [[
    " right click menu settings
    " auvmenu PopUp.-1-
    vnoremenu PopUp.CodeAction\ selected <Plug>(coc-codeaction-selected)
    vnoremenu PopUp.Refactor <Plug>(coc-codeaction-refactor-selected)
    vnoremenu PopUp.-2- :
    vnoremenu PopUp.Translate <cmd>Pantran<CR>

    aunmenu PopUp.How-to\ disable\ mouse
    " aunmenu PopUp.-1-
    nnoremenu PopUp.Definition <Plug>(coc-definition)
    nnoremenu PopUp.Implementation <Plug>(coc-implementation)
    nnoremenu PopUp.References <Plug>(coc-references)
    nnoremenu PopUp.Type\ Definition <Plug>(coc-type-definition)
    nnoremenu PopUp.Rename <Plug>(coc-rename)
    nnoremenu PopUp.-2- :
    nnoremenu PopUp.Open\ Fold  zO
    nnoremenu PopUp.Close\ Fold zC
    nnoremenu PopUp.-3- :
    nnoremenu PopUp.Coc\ Fix <Plug>(coc-fix-current)
    nnoremenu PopUp.CodeAction <Plug>(coc-codeaction)
    nnoremenu PopUp.CodeAction\ Line <Plug>(coc-codeaction-line)
]]

-----------------------------
---- quick fix re-format ----
-----------------------------

local fn = vim.fn

function _G.qftf(info)
    local items
    local ret = {}
    -- The name of item in list is based on the directory of quickfix window.
    -- Change the directory for quickfix window make the name of item shorter.
    -- It's a good opportunity to change current directory in quickfixtextfunc :)
    --
    -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
    -- local root = getRootByAlterBufnr(alterBufnr)
    -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
    --
    if info.quickfix == 1 then
        items = fn.getqflist({ id = info.id, items = 0 }).items
    else
        items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
    end
    local limit = 31
    local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
    local validFmt = '%s │%5d:%-3d│%s %s'
    for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ''
        local str
        if e.valid == 1 then
            if e.bufnr > 0 then
                fname = fn.bufname(e.bufnr)
                if fname == '' then
                    fname = '[No Name]'
                else
                    fname = fname:gsub('^' .. vim.env.HOME, '~')
                end
                -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
                if #fname <= limit then
                    fname = fnameFmt1:format(fname)
                else
                    fname = fnameFmt2:format(fname:sub(1 - limit))
                end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
        else
            str = e.text
        end
        table.insert(ret, str)
    end
    return ret
end

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Open Telescope on startup if the first argument is a directory
local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        local first_arg = vim.v.argv[3]
        if first_arg and vim.fn.isdirectory(first_arg) == 1 then
            -- Vim creates a buffer for folder. Close it.
            vim.cmd(":bd 1")
            require("telescope.builtin").find_files({ search_dirs = { first_arg } })
        end
    end,
    group = ts_group,
})


vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.code-workspace",
    callback = function()
        vim.cmd("set filetype=json")
    end,
})
