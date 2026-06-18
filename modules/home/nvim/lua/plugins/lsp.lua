return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { "lua_ls", "nixd", "clangd", "qmlls", "rust_analyzer" }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end
    end,
  },
}
