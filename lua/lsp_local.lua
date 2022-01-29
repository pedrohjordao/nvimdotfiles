local M = {}

function M.setup() 
	local lspconfig = require('lspconfig')
	local on_attach = function(_, bufnr)
	  local opts = { noremap = true, silent = true }
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
	end

	-- nvim-cmp supports additional completion capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	-- Enable the following language servers
	local servers = { 'clangd', 'pyright', 'tsserver' }
	for _, lsp in ipairs(servers) do
	  lspconfig[lsp].setup {
	    on_attach = on_attach,
	    capabilities = capabilities,
	  }
	end

	-- lsps that need manual setup
	-- Scala
	vim.cmd [[augroup lsp]]
	vim.cmd [[au!]]
	vim.cmd [[au FileType java,scala,sbt lua require("metals").initialize_or_attach({})]]
	vim.cmd [[augroup end]]

	-- Rust
	require('rust-tools').setup {}

	-- Lua
	local sumneko_binary_path = vim.fn.exepath('lua-language-server')
	local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")


	require('lspconfig').sumneko_lua.setup {
	    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
	    settings = {
		Lua = {
		runtime = {
		    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		    version = 'LuaJIT',
		    -- Setup your lua path
		    path = runtime_path,
		},
		diagnostics = {
		    -- Get the language server to recognize the `vim` global
		    globals = {'vim'},
		},
		workspace = {
		    -- Make the server aware of Neovim runtime files
		    library = vim.api.nvim_get_runtime_file("", true),
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
		    enable = false,
		},
		},
	    },
	}
end

return M