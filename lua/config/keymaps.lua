vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local mode_nv = { "n", "v" }
local mode_i = { "i" }
local mode_n = { "n" }
local mode_c = { "c" }
local mode_iv = { "i", "v" }

local mappings = {
    { from = "JK", to = "<ESC>", mode = mode_iv },
    { from = "<C-s>", to = ":w<CR>", mode = mode_n },
    { from = "<C-q>", to = ":q<CR>", mode = mode_n },
    { from = "H", to = "^", mode = mode_nv },
    { from = "L", to = "$", mode = mode_nv },
    { from = "Y", to = "0", mode = mode_nv },
    { from = "T", to = "H", mode = mode_n },
    { from = "B", to = "L", mode = mode_n },
    { from = "<A-h>", to = "g^", mode = mode_n },
    { from = "<A-j>", to = "gj", mode = mode_n },
    { from = "<A-k>", to = "gk", mode = mode_n },
    { from = "<A-l>", to = "g$", mode = mode_n },
    { from = "<A-y>", to = "g0", mode = mode_n },
    { from = "<C-j>", to = "7j", mode = mode_nv },
    { from = "<C-k>", to = "7k", mode = mode_nv },
    { from = "sh", to = ":set splitright<CR>:vsplit<CR>", mode = mode_n },
    { from = "sl", to = ":set nosplitright<CR>:vsplit<CR>", mode = mode_n },
    { from = "sj", to = ":set splitbelow<CR>:split<CR>", mode = mode_n },
    { from = "sk", to = ":set nosplitbelow<CR>:split<CR>", mode = mode_n },
    { from = "<LEADER>h", to = "<C-w>h", mode = mode_n },
    { from = "<LEADER>j", to = "<C-w>j", mode = mode_n },
    { from = "<LEADER>k", to = "<C-w>k", mode = mode_n },
    { from = "<LEADER>l", to = "<C-w>l", mode = mode_n },
    { from = "<up>", to = ":res +1<CR>", mode = mode_n },
    { from = "<down>", to = ":res -1<CR>", mode = mode_n },
    { from = "<left>", to = ":vertical res +1<CR>", mode = mode_n },
    { from = "<right>", to = ":vertical res -1<CR>", mode = mode_n },
    { from = "s", to = "<nop>", mode = mode_n },
    { from = "<LEADER><CR>", to = ":nohlsearch<CR>", mode = mode_n },
    { from = "《", to = "《》<LEFT>", mode = mode_i },
    { from = "（", to = "（）<LEFT>", mode = mode_i },
    { from = "【", to = "【】<LEFT>", mode = mode_i },
    { from = "‘", to = "‘’<LEFT>", mode = mode_i },
    { from = "“", to = "“”<LEFT>", mode = mode_i },
    { from = "<C-a>", to = "<S-left>", mode = mode_c },
    { from = "<C-e>", to = "<S-right>", mode = mode_c },
    { from = "VV", to = "<C-q>", mode = mode_n }
}

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
