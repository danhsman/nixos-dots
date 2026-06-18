return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        nix = { "statix" },
        c = { "cpplint" },
        python = { "pylint" },
      }
    end,
  },
}
