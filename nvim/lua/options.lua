vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.g.colorscheme = 'github_dark_dimmed'

-- Set the colorscheme
local status, _ = pcall(vim.cmd, 'colorscheme ' .. vim.g.colorscheme)
if not status then
    print('Error: colorscheme not found')
end
