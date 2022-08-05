local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup {
		context_commentstring = { enable = true },
		-- One of "all", "maintained" (parsers with maintainers), or a list of languages
		ensure_installed = "all",

		-- Install languages synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- highlight = {
		-- 	-- `false` will disable the whole extension
		-- 	enable = true,
		-- },
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},

		textsubjects = {
			enable = true,
			keymaps = {
				['.'] = 'textsubjects-smart',
				[';'] = 'textsubjects-container-outer',
			}
		},
		-- nvim-treesitter-textobjects
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},

			swap = {
				enable = true,
				swap_next = {
					["<leader>rx"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>rX"] = "@parameter.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},

			lsp_interop = {
				enable = true,
				border = "none",
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
			},
		},
	}
end

return M
