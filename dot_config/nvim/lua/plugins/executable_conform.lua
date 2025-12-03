return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 2500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixpkgs-fmt" },
      python = { "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      ejs = { "prettierd", "prettier" },
      cpp = { "clang_format" },
      c = { "clang_format" }
    },
  },
}
