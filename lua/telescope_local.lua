local M = {}

function M.setup()
	local opt = { noremap = true, silent = true }
	-- mappings 
	vim.api.nvim_set_keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fg", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fc", [[<Cmd>lua require('telescope.builtin').commands()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fq", [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fl", [[<Cmd>lua require('telescope.builtin').loclist()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fr", [[<Cmd>lua require('telescope.builtin').registers()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>fk", [[<Cmd>lua require('telescope.builtin').keymaps()<CR>]], opt)

	-- extra git mappings
	vim.api.nvim_set_keymap("n", "<Leader>gc", [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]], opt)
	vim.api.nvim_set_keymap("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], opt)
end

return M
