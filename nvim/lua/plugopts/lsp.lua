local ok, _ = pcall(require, "mason")
if not ok then
  return
end

local ok, lsp = pcall(require, "lspconfig")
if not ok then
  return
end

local protocol = require("vim.lsp.protocol")
local cmp = require("cmp")
local root_pattern = require("lspconfig").util.root_pattern

require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true,
}

-- Use on_attach function to map only these keys after LSP attaches to current buffer...
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function ()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

-- Setup cmp
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
    { name = "buffer" })
}

-- Setup lspconfig
local capabilities = require("cmp_nvim_lsp").update_capabilities(protocol.make_client_capabilities())

lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim",},
      }
    }
  }
}

lsp.ccls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = root_pattern("compile-command.json", ".ccls"),
  init_options = {
    compilationDatabaseDirectory = "build",
    cache = {
      directory = "/tmp/ccls"
    },
    clang = {
      excludeArgs = { "-frounding-math" }
    }
  }
}
