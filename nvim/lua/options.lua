local o = vim.opt
local g = vim.g

o.termguicolors = true
o.wildignorecase = true
o.wildignore = ".git,*.pyc,*.pyo,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,**/tmp/**,*.DS_Store,**/node_modules/**"
o.backup = false
o.writebackup = false
o.swapfile = false
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.clipboard = "unnamedplus"
o.updatetime = 250

-- UI
o.splitbelow = true
o.splitright = true
o.number = true
o.relativenumber = true
o.foldenable = true
o.cursorline = true
o.scrolloff = 2
o.sidescrolloff = 3
o.background = "dark"

-- Editing
o.mouse = "nv"
o.ignorecase = true
o.smartcase = true
o.smarttab = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.wrap = false
o.linebreak = true
o.showbreak = '↳  '
o.backspace = "indent,eol,start"

-- Behavior
o.hidden = true
o.completeopt = "menu,menuone,noselect"

-- Leader
g.mapleader = " "
g.maplocalleader = " "
