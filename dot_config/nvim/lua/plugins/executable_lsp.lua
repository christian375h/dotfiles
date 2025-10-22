return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "gi", vim.lsp.buf.implementation, opts)
        keymap("n", "<leader>dg", vim.diagnostic.open_float, opts)
      end

      local servers = {
        "ts_ls",
        "pyright",
        "html",
        "lua_ls",
        "tailwindcss",
        "eslint",
        "emmet_ls",
        "dartls",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = { debounce_text_changes = 300 },
        })
      end

      vim.lsp.enable(servers)
    end,
  },
}
