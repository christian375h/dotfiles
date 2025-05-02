return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Function to attach keybindings when LSP starts
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set

        -- Go to definition (gd)
        keymap("n", "gd", vim.lsp.buf.definition, opts)

        -- Alternative: Go to definition with <leader>gd
        keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)

        -- Show references (gr)
        keymap("n", "gr", vim.lsp.buf.references, opts)

        -- Hover documentation (K)
        keymap("n", "K", vim.lsp.buf.hover, opts)

        -- Go to implementation (gi)
        keymap("n", "gi", vim.lsp.buf.implementation, opts)

        vim.keymap.set("n", "<leader>dg", vim.diagnostic.open_float, { noremap = true, silent = true })
      end

      -- Setup LSP servers with `on_attach`
      local servers = { "ts_ls", "pyright", "html", "lua_ls", "tailwindcss", "eslint", "emmet_ls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  }
}
