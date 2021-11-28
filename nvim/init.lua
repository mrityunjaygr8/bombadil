require "impatient"
require("plugins")

require("options")

require("nvim-tree").setup()

require('nightfox').load("nightfox")
require("lualine").setup({
  options = {
    theme = "nightfox",
    section_separators = "",
    component_separators = ""
  }
})


-- GitSigns
require("gitsigns").setup {
  signs = {
    add = { hl = "GitGutterAdd", text = "+" },
    change = { hl = "GitGutterChange", text = "~" },
    delete = { hl = "GitGutterDelete", text = "_" },
    topdelete = { hl = "GitGutterDelete", text = "‾" },
    changedelete = { hl = "GitGutterChange", text = "~" },
  },
}
require('config.telescope')
require('config.nvim-treesitter')
require('config.lsp')
require('config.cmp')
require('config.lspsaga')
require('config.formatter')

require("keymaps")

