return {
   cmd = { "lua-language-server" },
   filetypes = { "lua" },
   root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
   settings = {
      Lua = {
         runtime = {
            version = 'LuaJIT',
            path = { 'lua/?.lua', 'lua/?/init.lua' },
         },
         diagnostics = {
            globals = { 'vim' },
         },
         telemetry = {
            enable = false,
         },
         workspace = {
            checkThirdParty = falsealse,
            library = {
               vim.env.VIMRUNTIME,
            },
         },
      },
   },
}
