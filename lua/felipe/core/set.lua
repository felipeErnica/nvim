vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.scrolloff = 8
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.fillchars = { eob = " " }

vim.g.mapleader = " "

vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.iskeyword:append("-")

vim.opt.cursorline = true

