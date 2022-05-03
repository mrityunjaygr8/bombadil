-- Load snippets
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- Load custom javascript
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/typescript" } }
require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/python" } }

ls.filetype_extend("all", { "_" })
