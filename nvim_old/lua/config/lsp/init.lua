local M = {}

local servers = {
	gopls = {},
	html = {},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
	},
	pyright = {},
	rust_analyzer = {},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand "$VIMRUNTIME/lua"] = true,
						[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
					},
				},
			},
		},
	},
	tsserver = {},
	vimls = {},
}


local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("config.lsp.keymaps").setup(client, bufnr)
	-- Configure highlighting
	require("config.lsp.highlighting").setup(client)

	-- Configure formatters
	require("config.lsp.null-ls.formatters").setup(client, bufnr)
	-- Configure for Typescript
	if client.name == "tsserver" then
		require("config.lsp.ts-utils").setup(client)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities) -- for nvim-cmp

local opts = {
	on_attach = on_attach,
	capabilities = capabilities, -- for nvim-cmp
	flags = {
		debounce_text_changes = 150,
	},
}

require("config.lsp.handlers").setup()

function M.setup()
	require("config.lsp.null-ls").setup(opts)
	require("config.lsp.installer").setup(servers, opts)
end

return M
