vim.g.mapleader = " "
vim.g.maplocaleader = "\\"

vim.g.autoformat = true

vim.g.snacks_animate = true

vim.g.deprecation_warnings = false

vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true
opt.confirm  = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.linebreak = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.ruler = false
opt.scrolloff = 4
opt.smartindent = true
opt.smartcase = true
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.winminwidth = 5

