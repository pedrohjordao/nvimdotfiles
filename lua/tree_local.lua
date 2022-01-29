local set_keymap = vim.api.nvim_set_keymap

local M = {}

function M.setup() 
	require'nvim-tree'.setup {}
	set_keymap('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
end

return M
