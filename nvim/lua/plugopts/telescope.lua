local ok, _ = pcall(require, "telescope")
if not ok then
  return
end

require("telescope").setup {
  -- default = {},
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["<leader>cd"] = function(prompt_bufnr)
            local sel = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(sel.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("silent cd %s", dir))
          end
        }
      }
    }
  }
}
