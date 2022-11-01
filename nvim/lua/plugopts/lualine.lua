local ok, plugin = pcall(require, 'lualine')
if not ok then
  return
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
    disabled_filetypes = {
      statusline = { "tagbar" }
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 3,
        symbols = {
          readonly = '[RO]'
        }
      }
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'diff'},
    lualine_z = {'progress', 'location'}
  }
}
