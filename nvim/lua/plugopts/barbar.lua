local ok, _ = pcall(require, "bufferline")
if not ok then
  return
end

require("bufferline").setup {
  animation = false,  -- I love snappy more than smoothie.
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
  icon_pinned = "📌",
}
