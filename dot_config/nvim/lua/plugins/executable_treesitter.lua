return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "javascript", "typescript", "html", "python", "tsx" },
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "help",
      callback = function()
        vim.cmd("TSBufDisable highlight")
      end,
    })
  end
}
