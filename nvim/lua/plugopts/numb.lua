local ok, _ = pcall(require, "numb")
if not ok then
  return
end

require("numb").setup {
  number_only = true
}
