local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

return packer.startup({function(use)
  use { "wbthomason/packer.nvim" }

  -- Color scheme
  use { "ellisonleao/gruvbox.nvim" } 

  -- Icons
  use { "kyazdani42/nvim-web-devicons" }

  -- Statusline
  use { "nvim-lualine/lualine.nvim" }

  -- Tabline
  use { "romgrk/barbar.nvim" }

  -- Outline viewer
  use { "preservim/tagbar" }

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }

  if packer_bootstrap then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = require("packer.util").float,
  }
}})
