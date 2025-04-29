return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- this is to allow for automatically downloading LSP servers
    "williamboman/mason.nvim",
    -- This is so that we don"t have to do require("lspconfig")[server_name].setup for all servers
    "williamboman/mason-lspconfig.nvim",
    -- This is to setup lua env in neovim so it understands built in globals such as vim
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- This is autocompletion
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- custom handlers
        -- ["rust_analyzer"] = function ()
        --   require("rust-tools").setup {}
        -- end
      },
    })
  end,
}
