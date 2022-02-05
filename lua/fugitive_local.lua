local M = {}

function M.setup() 
	vim.api.nvim_set_keymap('n', '<leader>gv', ':Gv<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gg', ':G<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gP', ':G push -u origin head<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gf', ':G push --force<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gp', ':G pull<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gl', ':Glog<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gr', ':Gread<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gr', ':Grebase ', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gb', ':Gblame<cr>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<leader>gw', ':Gwrite!<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>gm', ':Gitmessenger<cr>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiff<cr>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gdh', ':diffget //2<cr>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gdl', ':diffget //3<cr>', {noremap = true, silent = true})
end

return M
