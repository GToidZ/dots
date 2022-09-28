local ok, _ = pcall(require, "telescope")
if not ok then return end

local util = require("util")
local nnoremap = util.nnoremap

-- Pickers
nnoremap("<leader>Ff", ":Telescope find_files<CR>")
nnoremap("<leader>Fb", ":Telescope buffers<CR>")
nnoremap("<leader>Fr", ":Telescope oldfiles<CR>")
nnoremap("<leader>?", ":Telescope keymaps<CR>")

local tst, _ = pcall(require, "nvim-treesitter")
if tst then
  nnoremap("<leader>Ft", ":Telescope treesitter<CR>")
end

