local status_ok_mason, mason = pcall(require, "mason")
local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason then
  return
end

if not status_ok_mason_lspconfig then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua", "gopls", "pyright" },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
})
