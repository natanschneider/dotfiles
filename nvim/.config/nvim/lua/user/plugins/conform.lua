return {
  'stevearc/conform.nvim',
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      javascript = { "eslint_d", stop_after_first = true },
      typescript = { "eslint_d", stop_after_first = true },
      typescriptreact = { "eslint_d", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 1000,
      -- lsp_format = "fallback",
    },
  },
}
