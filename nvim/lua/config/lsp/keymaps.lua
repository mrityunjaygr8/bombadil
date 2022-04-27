local M = {}

local whichkey = require "which-key"

local keymap = vim.keymap.set

local function keymappings(client, bufnr)
	local opts = { noremap = true, silent = true }

	-- Key mappings
	keymap("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	keymap("n", "[d", vim.diagnostic.goto_prev)
	keymap("n", "]d", vim.diagnostic.goto_next)
	keymap("n", "[e", "", { callback = vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) })
	keymap("n", "]e", "", { callback = vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) })

	-- Whichkey
	local keymap_l = {
		l = {
			name = "Code",
			R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
			a = { "<cmd>Telescope lsp_code_actions<CR>", "Code Action" },
			d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
			i = { "<cmd>LspInfo<CR>", "Lsp Info" },
			n = { "<cmd>Lspsaga rename<CR>", "Rename" },
			r = { "<cmd>Telescope lsp_references<CR>", "Diagnostics" },
			t = { "<cmd>TroubleToggle<CR>", "Trouble" },
		}
	}
	if client.resolved_capabilities.document_formatting then
		keymap_l.l.f = { vim.lsp.buf.formatting, "Format Document" }
	end

	local keymap_g = {
		name = "Goto",
		d = { vim.lsp.buf.definition, "Definition" },
		D = { vim.lsp.buf.declaration, "Declaration" },
		s = { vim.lsp.buf.signature_help, "Signature Help" },
		I = { vim.lsp.buf.implementation, "Goto Implementation" },
		t = { vim.lsp.buf.type_definition, "Goto Type Definition" },
	}
	whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
	whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

function M.setup(client, bufnr)
	keymappings(client, bufnr)
end

return M
