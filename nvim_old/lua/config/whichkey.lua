local M = {}
local whichkey = require "which-key"

local conf = {
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
	},
}
whichkey.setup(conf)

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
	mode = "v", -- Visual mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymaps()
	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		["G"] = { "<cmd>LazyGit<CR>", "LazyGit" },

		b = {
			name = "Buffer",
			c = { "<Cmd>bd!<Cr>", "Close current buffer" },
			D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		f = {
			name = "Find",
			f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
			d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			r = { "<cmd>Telescope file_browser<cr>", "Browser" },
			w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		},
		p = {
			name = "Project",
			p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
			s = { "<cmd>Telescope repo list<cr>", "Search" },
		},
	}

	whichkey.register(mappings, opts)
end

local function code_keymap()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
			vim.schedule(CodeRunner)
		end,
	})

	function CodeRunner()
		local bufnr = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
		local keymap = nil
		if ft == "python" then
			keymap = {
				name = "Code",
				r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
				m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
			}
		elseif ft == "lua" then
			keymap = {
				name = "Code",
				r = { "<cmd>luafile %<cr>", "Run" },
			}
		elseif ft == "go" then
			keymap = {
				name = "Code",
				r = { "<cmd>GoRun<cr>", "Run" },
			}
		elseif ft == "typescript" or ft == "typescriptreact" then
			keymap = {
				name = "Code",
				o = { "<cmd>TSLspOrganize<cr>", "Organize" },
				r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
				i = { "<cmd>TSLspImportAll<cr>", "Import All" },
			}
		end

		if keymap ~= nil then
			whichkey.register(
				{ x = keymap },
				{ mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
			)
		end
	end
end

local function visual_keymap()
	local keymap = {
		r = {
			name = "Refactor",
			e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
			f = {
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
				"Extract Function to File",
			},
			v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
			i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
			r = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
			V = { [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]], "Debug Print Var" },
		},
	}

	whichkey.register(keymap, v_opts)
end

function M.setup()
	normal_keymaps()
	code_keymap()
	visual_keymap()

end

return M
