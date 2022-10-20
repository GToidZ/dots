local util = require("util")
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
-- local inoremap = util.inoremap

-- Splits
nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- Clipboard
-- Copy
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- Paste
nnoremap("<leader>p", '"+p')
vnoremap("<leader>p", '"+p')
nnoremap("<leader>P", '"+P')
vnoremap("<leader>P", '"+P')

-- Clear highlight from search
nnoremap("<leader>//", ":nohlsearch<CR>")
vnoremap("<leader>//", ":nohlsearch<CR>")
