local function apply_highlights()
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff7eb6" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#ff7eb6" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#ff7eb6" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#ff7eb6" })

  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff7eb6", bold = true })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff7eb6", bg = "NONE" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#ff7eb6", fg = "#161616" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

apply_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_highlights })
