local M = {} 

function M.setup()
	vim.cmd("call wilder#setup({'modes': [':', '/', '?'], 'next_key': '<Tab>', 'previous_key': '<S-Tab>'})")
end

return M
