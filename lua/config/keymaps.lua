vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local mode_nv = { "n", "v" }
local mode_i = { "i" }
local mode_n = { "n" }
local mode_c = { "c" }
local mode_iv = { "i", "v" }

local mappings = {
    { from = "JK", to = "<ESC>", mode = mode_iv },
    { from = "<C-s>", to = "<cmd>w<cr>", mode = mode_n },
    { from = "<C-q>", to = "<cmd>q<cr>", mode = mode_n },
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
    { from = "sh", to = "<cmd>set splitright<cr><cmd>vsplit<cr>", mode = mode_n },
    { from = "sl", to = "<cmd>set nosplitright<cr><cmd>vsplit<cr>", mode = mode_n },
    { from = "sj", to = "<cmd>set splitbelow<cr><cmd>split<cr>", mode = mode_n },
    { from = "sk", to = "<cmd>set nosplitbelow<cr><cmd>split<cr>", mode = mode_n },
    { from = "<LEADER>h", to = "<C-w>h", mode = mode_n },
    { from = "<LEADER>j", to = "<C-w>j", mode = mode_n },
    { from = "<LEADER>k", to = "<C-w>k", mode = mode_n },
    { from = "<LEADER>l", to = "<C-w>l", mode = mode_n },
    { from = "<up>", to = "<cmd>res +1<cr>", mode = mode_n },
    { from = "<down>", to = "<cmd>res -1<cr>", mode = mode_n },
    { from = "<left>", to = "<cmd>vertical res +1<cr>", mode = mode_n },
    { from = "<right>", to = "<cmd>vertical res -1<cr>", mode = mode_n },
    { from = "s", to = "<nop>", mode = mode_n },
    { from = "<LEADER><CR>", to = "<cmd>nohlsearch<cr>", mode = mode_n },
    { from = "《", to = "《》<LEFT>", mode = mode_i },
    { from = "（", to = "（）<LEFT>", mode = mode_i },
    { from = "【", to = "【】<LEFT>", mode = mode_i },
    { from = "‘", to = "‘’<LEFT>", mode = mode_i },
    { from = "“", to = "“”<LEFT>", mode = mode_i },
    { from = "<C-a>", to = "<S-left>", mode = mode_c },
    { from = "<C-e>", to = "<S-right>", mode = mode_c },
    { from = "VV", to = "<C-q>", mode = mode_n },
    { from = "<leader>ci", to = "<cmd>normal gcc<cr>", mode = mode_nv }
}

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
