-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.filetype = on

vim.filetype.add({
  extension = {
    cls = "apex",
    apex = "apex",
    trigger = "apex",
    soql = "soql",
    sosl = "sosl",
    log = "sflog",
  },
})

vim.filetype.add({
  extension = {
    cmp = "html",
  },
})

--Salesforce filetypes

vim.filetype.add({
  extension = {
    design = "html",
  },
})

vim.filetype.add({
  extension = {
    auradoc = "html",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "st",
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mallard",
  callback = function()
    vim.cmd("set filetype=html")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.trigger" },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.apex" },
  callback = function()
    vim.cmd("set filetype=apex")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.log" },
  callback = function()
    vim.cmd("set filetype=sflog")
  end,
})

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#545c7e", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#c8d3f5", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#545c7e", bold = true })

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#222436" })
vim.api.nvim_set_hl(0, "CmpNormalSelect", { bg = "#82aaff" })

vim.api.nvim_create_augroup("_terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal winhighlight=Normal:CmpNormal",
  group = "_terminal",
})
