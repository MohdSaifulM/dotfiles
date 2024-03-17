vim.g.neoformat_enabled_python = { 'autopep8', 'yapf', 'docformatter' }
vim.g.neoformat_enabled_javascript = { 'prettier' }
vim.g.neoformat_enabled_lua = { 'lua-format' }
vim.g.neoformat_enabled_java = { 'prettier' }
vim.g.neoformat_enabled_php = { 'phpcbf' }
vim.g.neoformat_enabled_markdown = { 'prettier' }

vim.g.neoformat_enabled_jade = { 'pug-beautifier' }
vim.g.neoformat_enabled_pug = { 'pug-beautifier' }
vim.g.neoformat_enabled_scss = { 'prettier' }
vim.g.neoformat_enabled_html = { 'prettier' }

vim.g.neoformat_enabled_json = { 'prettier' }

vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1


vim.g.neoformat_enabled = true
vim.api.nvim_set_keymap('n', '<leader>=', ':Neoformat<CR>', { noremap = true, silent = true })
