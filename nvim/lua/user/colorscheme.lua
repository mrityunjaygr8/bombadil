local status_ok, everblush = pcall(require, "everblush")
if not status_ok then
  return
end

-- vim.g.catppuccin_flavour = "mocha"
-- catpuccin.setup()
-- vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme everblush]])
