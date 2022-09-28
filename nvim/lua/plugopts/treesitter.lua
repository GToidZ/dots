local ok, _ = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "c", "cpp", "lua", "python" },
  sync_install = true,
  auto_install = true,
}
