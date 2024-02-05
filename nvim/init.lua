require("lazy").setup("plugin")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.mouse = ""
vim.opt.hlsearch = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.cmd.colorscheme("slate")
vim.opt.textwidth = 0
vim.opt.scrolloff = 8
vim.opt.formatoptions = "blj"
vim.keymap.set("n", "<C-E>", ":e .<CR>", {noremap = true, silent = true})
