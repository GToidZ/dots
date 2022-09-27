local util = require("util")
local nnoremap = util.nnoremap

-- Tagbar
nnoremap("<leader>.", ":TagbarToggle j<CR>")

-- Barbar
local ok, _ = pcall(require, "bufferline")
if ok then
  -- Move to prev/next buffer
  nnoremap("<A-Left>", ":BufferPrevious<CR>")
  nnoremap("<A-Right>", ":BufferNext<CR>")
  -- Move buffer to prev/next
  nnoremap("<A-[>", ":BufferMovePrevious<CR>")
  nnoremap("<A-]>", ":BufferMoveNext<CR>")
  -- Pin buffer
  nnoremap("<A-/>", ":BufferPin<CR>")
  -- Close buffer
  nnoremap("<A-x>", ":BufferClose<CR>")
end
