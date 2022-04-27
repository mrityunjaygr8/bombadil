local api = vim.api
local g = vim.g
local opt = vim.opt


vim.keymap.set("", "<Space>", "<Nop>", {silent = true})
g.mapleader = " "
g.maplocalleader = " "


opt.termguicolors = true
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 300


local yankHighLight = function() vim.highlight.on_yank() end
local yankHighLightGroup = api.nvim_create_augroup("YankHighLight", {clear = true})
api.nvim_create_autocmd({"TextYankPost"}, {pattern = "*", callback = yankHighLight, group = yankHighLightGroup})

function _G.statusline()
    local filepath = '%f'
    local align_section = '%='
    local percentage_through_file = '%p%%'
    return string.format(
        '%s%s%s',
        filepath,
        align_section,
        percentage_through_file
    )
end

vim.cmd[[colorscheme catppuccin]]
