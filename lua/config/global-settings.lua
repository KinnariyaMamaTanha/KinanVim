vim.o.number = true
vim.o.relativenumber = true
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.scrolloff = 5
vim.o.sidescrolloff = 4
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
    " WSL2 yank support, according to https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/comment/el2vx7u/?utm_source=share&utm_medium=web2x
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " TODO: change this path according to your mount point
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
    augroup END
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
    vnoremenu PopUp.Translate :Pantran<CR>

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
