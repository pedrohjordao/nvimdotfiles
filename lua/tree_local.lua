local set_keymap = vim.api.nvim_set_keymap

local M = {}

function M.setup()
	vim.cmd('let g:nvim_tree_group_empty = 1')
	require'nvim-tree'.setup {}
	set_keymap('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
end

return M
