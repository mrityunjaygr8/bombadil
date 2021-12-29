-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

vim.g.expandtab = true
vim.g.shiftwidth = 2
vim.g.tabstop = 2
vim.g.hidden = true

vim.wo.signcolumn = "yes:2"

vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scrolloff=999")

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- vim.cmd [[colorscheme ghdark]]
-- vim.g.tokyonight_style = "night"
-- vim.cmd[[colorscheme tokyonight]]
--vim.cmd 'colorscheme material'
----Lua:
--vim.g.material_style = "deep ocean"

-- set gutentags cache dir
vim.g.gutentags_cache_dir = "~/.cache"

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup yankhighlight
    autocmd!
    autocmd textyankpost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Illuminate config
vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.py,*.tsx,*.ts FormatWrite
augroup END
]],
  true
)
