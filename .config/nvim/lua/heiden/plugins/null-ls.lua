-- ~/.config/nvim/lua/plugins/null-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
    autostart = true,
    sources = {
        null_ls.builtins.diagnostics.stylelint.with({
            filetypes = { "css", "scss", "less", "html" },  -- Lägg till "html" för att linta CSS i HTML-filer
        }),
    },
})

return {}
