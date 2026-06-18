return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        nix = { "nixpkgs_fmt" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
