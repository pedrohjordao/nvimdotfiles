require('impatient')
local cmd = vim.cmd
local g = vim.g
local set_keymap = vim.api.nvim_set_keymap
local indent = 2

g.mapleader = ' '
cmd('syntax enable')
cmd('syntax on')
cmd('set hidden')

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Make line numbers default
vim.wo.number = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

set_keymap('n', '<leader>o', ':res<CR>:vertical res<CR>', {noremap = true, silent = true})
set_keymap('n', '<leader>O', ':only', {noremap = true})
set_keymap('i', '<C-d>', '<Del>', {noremap = true})
set_keymap('i', '<C-c>', '<Esc>', {noremap = true})
set_keymap('v', '<', '<gv', {noremap = true})
set_keymap('v', '>', '>gv', {noremap = true})

if (not vim.g.vscode) then
	require('plugins')
	require('term')
end
