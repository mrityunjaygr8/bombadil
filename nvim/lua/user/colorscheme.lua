local status_ok, catpuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

vim.g.catppuccin_flavour = "mocha"
catpuccin.setup()
vim.cmd([[colorscheme catppuccin]])
