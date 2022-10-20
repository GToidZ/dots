local ok, _ = pcall(require, 'gruvbox')
if not ok then
  return
end

require('gruvbox').setup {
  italic = false
}

vim.cmd([[colorscheme gruvbox]])

